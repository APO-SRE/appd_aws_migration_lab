#!/bin/bash

#
# Utility script to initialize the workshop prerequisites on the Cloud9 EC2 instance
#
# Before this script is run, the lab user should execute the four commands seen below:
#
# git clone https://github.com/APO-SRE/appd_aws_migration_lab.git migration_workshop
# cd migration_workshop
# chmod +x setup_workshop.sh
# export appd_workshop_user=jedi
#
# NOTE: All inputs are defined by external environment variables.
#       Optional variables have reasonable defaults, but you may override as needed.
#---------------------------------------------------------------------------------------------------

# [MANDATORY] workshop user identity.
appd_workshop_user="${appd_workshop_user:-}"

echo ""
echo ""
echo ""
echo ""

echo "         #############################################################################################################################################################################################################"
echo "                                                                                                                                                                                                                      "
echo "                                                                                                                                                                                                                      "
echo "            %%%%%%%          %%%%%%%%%%%%%%%     %%%%%%%%%%%%%%%     %%%%%%%%%%%%%%%     %%%         %%%    %%%%%      %%%          %%%%%%%          %%%           %%%    %%%        %%%%%%%%%%%        %%%%%%%%%%%   "
echo "           %%%   %%%         %%%          %%%    %%%          %%%    %%%          %%%     %%%       %%%     %%% %%     %%%         %%%   %%%         %%%%         %%%%    %%%      %%%                 %%%            "
echo "          %%%     %%%        %%%           %%%   %%%           %%%   %%%           %%%     %%%     %%%      %%%  %%    %%%        %%%     %%%        %% %%       %% %%    %%%     %%%                   %%%           "
echo "         %%%       %%%       %%%          %%%    %%%          %%%    %%%            %%%     %%%   %%%       %%%   %%   %%%       %%%       %%%       %%% %%     %% %%%    %%%    %%%                      %%%         "
echo "        %%%%%%%%%%%%%%%      %%%%%%%%%%%%%%%     %%%%%%%%%%%%%%%     %%%            %%%       %%%%%         %%%    %%  %%%      %%%%%%%%%%%%%%%      %%%   %%  %%  %%%    %%%    %%%                        %%%       "
echo "       %%%           %%%     %%%                 %%%                 %%%           %%%         %%%          %%%     %% %%%     %%%           %%%     %%%    %%%%   %%%    %%%     %%%                        %%%      "
echo "      %%%             %%%    %%%                 %%%                 %%%          %%%          %%%          %%%      %%%%%    %%%             %%%    %%%           %%%    %%%      %%%                       %%%      "
echo "     %%%               %%%   %%%                 %%%                 %%%%%%%%%%%%%%%           %%%          %%%       %%%%   %%%               %%%   %%%           %%%    %%%        %%%%%%%%%%%   %%%%%%%%%%%%       "
echo "                                                                                                                                                                                                                      "
echo "                                                                                                                                                                                                                      "
echo "  ############################################################################################################################################################################################################        "

echo ""
echo ""
echo ""
echo ""

echo " ##################################################################################    STARTING APPDYNAMICS CLOUD WORKSHOP PREREQUISITES    ##########################################################################"

##### check to see if we have the XFS file system
df_output=$(df -khT)

if [[ !$df_output != *"/dev/nvme0n1p1 xfs"* ]]; then
  echo "CloudWorkshop|ERROR| - Oops, :(  it looks like you may have accidentally selected Amazon Linux instead of Amazon Linux 2 for the Platform option."
  echo "CloudWorkshop|ERROR| - Please discard this Cloud9 instance and create a new one with the required Amazon Linux 2 Platform option."
  #echo "$df_output"
  exit 1
fi

##### This assumes that the Git Repo has been cloned
if [ ! -d ./scripts/state ]; then
  mkdir ./scripts/state
fi

if [ ! -d ./applications/post-migration/application/.env ]; then
  mkdir ./applications/post-migration/application/.env
fi


##### Make all shell scripts executable
find ./ -type f -iname "*.sh" -exec chmod +x {} \;

##### Remove Windows CRLF from all shell scripts
sed -i -e 's/\r$//' ./scripts/*.sh
sed -i -e 's/\r$//' create_eks_cluster.sh
sed -i -e 's/\r$//' deploy_appdynamics_agents.sh.sh
sed -i -e 's/\r$//' deploy_eks_application.sh
sed -i -e 's/\r$//' teardown_workshop.sh


##### Hoping this will improve failure rate of volume resize
#if [ ! -d /opt/awscliv2 ]; then
#  sudo mkdir /opt/awscliv2
#  sudo chown -R ec2-user:ec2-user /opt/awscliv2
#  sudo ./scripts/install_al2_aws_cli_v2.sh
#fi


##### Resize the EBS Volume
# Rewrite the partition table so that the partition takes up all the space that it can.
sudo growpart /dev/nvme0n1 1

# Expand the size of the file system.
sudo xfs_growfs -d /

#./scripts/resize_al2_ebs_volume.sh


# check to see if user_id file exists and if so read in the user_id
if [ -f "./scripts/state/appd_workshop_user.txt" ]; then

  appd_workshop_user=$(cat ./scripts/state/appd_workshop_user.txt)

else
  
  # validate mandatory environment variables.

  if [ -z "$appd_workshop_user" ]; then
    echo "CloudWorkshop|ERROR| - 'appd_workshop_user' environment variable not set or is not at least five alpha characters in length."
    exit 1
  fi

  LEN=$(echo ${#appd_workshop_user})

  if [ $LEN -lt 5 ]; then
    echo "CloudWorkshop|ERROR| - 'appd_workshop_user' environment variable not set or is not at least five alpha characters in length."
    exit 1
  fi


  if [ "$appd_workshop_user" == "<YOUR USER NAME>" ]; then
    echo "CloudWorkshop|ERROR| - 'appd_workshop_user' environment variable not set properly. It should be at least five alpha characters in length."
    echo "CloudWorkshop|ERROR| - 'appd_workshop_user' environment variable should not be set to <YOUR USER NAME>."
    exit 1
  fi


  # write the user_id to a file
  echo "$appd_workshop_user" > ./scripts/state/appd_workshop_user.txt

  # echo $USER = ec2-user

  # write the C9 user to a file     example:  james.schneider
  echo "$C9_USER" > ./scripts/state/appd_env_user.txt

  # write the Hostname to a file   example:  ip-172-31-14-237.us-west-1.compute.internal
  echo "$HOSTNAME" > ./scripts/state/appd_env_host.txt

fi	

# !!!!!!! BEGIN BIG IF BLOCK !!!!!!!
if [ -f "./scripts/state/appd_workshop_setup.txt" ]; then

  appd_wrkshp_last_setupstep_done=$(cat ./scripts/state/appd_workshop_setup.txt)

  java -DworkshopUtilsConf=./scripts/workshop-setup.yaml -DworkshopLabUserPrefix=${appd_workshop_user} -DworkshopAction=setup -DlastSetupStepDone=${appd_wrkshp_last_setupstep_done} -DshowWorkshopBanner=false -jar ./AD-Workshop-Utils.jar

else


echo "####################################################################################################"
echo " Start Installing Java 1.8"
echo "####################################################################################################"
echo ""

sudo rpm --import https://yum.corretto.aws/corretto.key

sudo curl --silent -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo

sudo yum install -y java-1.8.0-amazon-corretto-devel

java -version

echo ""
echo "####################################################################################################"
echo " Finished Installing Java 1.8"
echo "####################################################################################################"
echo ""

##### Create directories for local agents

sudo rm -r -f -v /opt/appdynamics

sudo mkdir /opt/appdynamics

sudo mkdir /opt/appdynamics/javaagent

sudo mkdir /opt/appdynamics/dbagent

sudo mkdir /opt/appdynamics/dbagent/.svc

sudo mkdir /opt/appdynamics/simagent

sudo mkdir /opt/appdynamics/simagent/.svc

sudo chown -R ec2-user:ec2-user /opt/appdynamics


# write last setup step file
appd_wrkshp_last_setupstep_done="100"

echo "$appd_wrkshp_last_setupstep_done" > ./scripts/state/appd_workshop_setup.txt

java -DworkshopUtilsConf=./scripts/workshop-setup.yaml -DworkshopLabUserPrefix=${appd_workshop_user} -DworkshopAction=setup -DlastSetupStepDone=${appd_wrkshp_last_setupstep_done} -DshowWorkshopBanner=false -jar ./AD-Workshop-Utils.jar

fi
# !!!!!!! END BIG IF BLOCK !!!!!!!

##### Make all shell scripts executable
find ./ -type f -iname "*.sh" -exec chmod +x {} \;
