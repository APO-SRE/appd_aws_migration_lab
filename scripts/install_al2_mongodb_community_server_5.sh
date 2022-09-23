#!/bin/sh -eux
#---------------------------------------------------------------------------------------------------
# Execute this script like this 'sudo ./install_al2_mongodb_community_server_5.sh' 
# or else it will give permission denied error on line 42
#
# Install MongoDB Community Server 5.0 on Amazon Linux 2.
#
# MongoDB is a document database designed for ease of development and scaling. It is
# source-available, cross-platform, and classified as a NoSQL database program, MongoDB uses
# JSON-like documents with optional schemas.
#
# For more details, please visit:
#   https://www.mongodb.com/docs/manual/introduction/
#   https://www.mongodb.com/try/download/community/
#   https://www.mongodb.com/docs/upcoming/tutorial/install-mongodb-on-amazon/
#
# NOTE: All inputs are defined by external environment variables.
#       Optional variables have reasonable defaults, but you may override as needed.
#       Script should be run with 'root' privilege.
#---------------------------------------------------------------------------------------------------

set +x  # temporarily turn command display OFF.
echo "####################################################################################################"
echo " Start Installing MongoDB"
echo "####################################################################################################"
echo ""


# set default values for input environment variables if not set. -----------------------------------
# [OPTIONAL] mongodb community server install parameters [w/ defaults].
mongodb_server_admin_username="${mongodb_server_admin_username:-userAdmin}"     # [optional] MongoDB admin username (defaults to 'userAdmin').

mongodb_server_admin_password="${mongodb_server_admin_password:-welcome1}"      # [optional] admin password (defaults to 'welcome1').

mongodb_enable_access_control="${mongodb_enable_access_control:-false}"         # [optional] enable access control for mongodb (defaults to 'false').

# [OPTIONAL] fso lab devops home folder [w/ default].
devops_home="${devops_home:-/home/ec2-user}"                               # [optional] devops home (defaults to '/opt/fso-lab-devops').

# prepare the mongodb repository for installation. -------------------------------------------------
# create the mongodb repository.
cat <<EOF > /etc/yum.repos.d/mongodb-org-5.0.repo
[mongodb-org-5.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/5.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-5.0.asc
EOF

# install the mongodb database. --------------------------------------------------------------------
sudo yum -y install mongodb-org

# configure mongodb community server service. ------------------------------------------------------
# reload systemd manager configuration.
sudo systemctl daemon-reload

# start the mongodb service and configure it to start at boot time.
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl is-enabled mongod

# check that the mongodb service is running.
sudo systemctl status mongod

# verify installation. -----------------------------------------------------------------------------
# set mongodb shell environment variables.
PATH=/usr/bin:$PATH
export PATH

# verify mongodb version.
mongo --version

# verify mongodb shell version.
mongosh --version

# create mongodb user admin (conditional). ---------------------------------------------------------
if [ "$mongodb_enable_access_control" == "true" ]; then
  # create scripts directory (if needed).
  sudo mkdir -p ${devops_home}/installs/mongodb
  sudo cd ${devops_home}/installs/mongodb

  # generate the create mongodb admin user script.
  sudo rm -f createMongoDBAdminUser.js

  sudo cat <<EOF > createMongoDBAdminUser.js
db = connect("mongodb://localhost/admin");
db.createUser(
  {
    user: "${mongodb_server_admin_username}",
    pwd: "${mongodb_server_admin_password}",
    roles: [
      { role: "userAdminAnyDatabase", db: "admin" },
      { role: "readWriteAnyDatabase", db: "admin" }
    ]
  }
)
EOF

  # create the mongodb admin user.
  mongosh --file createMongoDBAdminUser.js
fi

# perform general mongodb housekeeping tasks. ------------------------------------------------------
# disable the mongodb free monitoring solution.
mongosh --quiet --eval "db.disableFreeMonitoring()"

# shutdown the mongodb database. -------------------------------------------------------------------
sudo systemctl stop mongod
#mongosh --quiet --eval "db.adminCommand( { shutdown: 1 } )"

# configure the mongodb service for access control (conditional). ----------------------------------
if [ "$mongodb_enable_access_control" == "true" ]; then
  mongod_service_file="mongod.conf"
  sudo cd /etc
  sudo cp -p ${mongod_service_file} ${mongod_service_file}.orig

  # define stream editor search strings.
  mongod_config_search="#security:"

  # define stream editor mongodb service config substitution strings.
  mongod_config_line_01="# security for access control."
  mongod_config_line_02="security:"
  mongod_config_line_03="  authorization: enabled"

  # insert mongodb security config lines before this comment: '#security:'.
  sudo sed -i -e "s/${mongod_config_search}/${mongod_config_line_01}\n${mongod_config_search}/g" ${mongod_service_file}
  sudo sed -i -e "s/${mongod_config_search}/${mongod_config_line_02}\n${mongod_config_search}/g" ${mongod_service_file}
  sudo sed -i -e "s/${mongod_config_search}/${mongod_config_line_03}\n${mongod_config_search}/g" ${mongod_service_file}

  # delete original security element.
  sudo sed -i -e "/${mongod_config_search}/d" ${mongod_service_file}

  # validate new mongodb service file.
  sudo cat ${mongod_service_file}
fi

# disable transparent huge pages (thp) for best performance. ---------------------------------------
# configure the disable thp service.
sudo cat <<EOF > /etc/systemd/system/disable-transparent-huge-pages.service
[Unit]
Description=Disable Transparent Huge Pages (THP)
DefaultDependencies=no
After=sysinit.target local-fs.target
Before=mongod.service

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'echo never | tee /sys/kernel/mm/transparent_hugepage/enabled > /dev/null'
ExecStart=/bin/sh -c 'echo never | tee /sys/kernel/mm/transparent_hugepage/defrag > /dev/null'

[Install]
WantedBy=basic.target
EOF

# reload systemd manager configuration.
sudo systemctl daemon-reload

# start the disable thp service and configure it to start at boot time.
sudo systemctl start disable-transparent-huge-pages
sudo systemctl enable disable-transparent-huge-pages
sudo systemctl is-enabled disable-transparent-huge-pages

# restart the mongodb service with the new configuration. ------------------------------------------
# start the mongodb service.
sudo systemctl start mongod

# check that the mongodb service is running.
sudo systemctl status mongod

# verify completed mongodb database configuration. -------------------------------------------------
# list mongodb users.
if [ "$mongodb_enable_access_control" == "true" ]; then
  echo "mongosh mongodb://localhost/admin --eval \"db.system.users.find()\" --authenticationDatabase \"admin\" -u \"${mongodb_server_admin_username}\" -p \"########\""

  mongosh mongodb://localhost/admin --eval "db.system.users.find()" --authenticationDatabase "admin" -u "${mongodb_server_admin_username}" -p "${mongodb_server_admin_password}"

else
  mongosh --eval "db.system.users.find()"
fi

# list mongodb installed databases.
if [ "$mongodb_enable_access_control" == "true" ]; then
  echo "mongosh --eval \"db.adminCommand( { listDatabases: 1, nameOnly: true} )\" --authenticationDatabase \"admin\" -u \"${mongodb_server_admin_username}\" -p \"########\""

  mongosh --eval "db.adminCommand( { listDatabases: 1, nameOnly: true} )" --authenticationDatabase "admin" -u "${mongodb_server_admin_username}" -p "${mongodb_server_admin_password}"

else
  mongosh --eval "db.adminCommand( { listDatabases: 1, nameOnly: true} )"
fi

echo ""
echo "####################################################################################################"
echo " Finished Installing MongoDB"
echo "####################################################################################################"
echo ""
