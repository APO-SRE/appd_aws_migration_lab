# appd_aws_migration_lab

Artifacts for AppDynamics AWS Cloud Migration lab.

After creating your Cloud9 instance and configuring it by following all the steps included in these web pages:

https://appd-modernization.awsworkshop.io/30_workshop_setup.html

https://appd-modernization.awsworkshop.io/30_workshop_setup/1_create_cloud9.html

https://appd-modernization.awsworkshop.io/30_workshop_setup/2_create_iam_role.html

https://appd-modernization.awsworkshop.io/30_workshop_setup/3_attach_iam_role.html

https://appd-modernization.awsworkshop.io/30_workshop_setup/4_cloud9_update.html


Then use the commands below to finish setting up the pre-migration version of the lab:

```
git clone https://github.com/APO-SRE/appd_aws_migration_lab.git migration_workshop
```

```
cd migration_workshop
```

```
chmod +x setup_workshop.sh
```

Set lab user id to at least 5 character name
```
export appd_workshop_user=xxxxx
```

OPTIONAL: If you want to target your own controller then edit the '/home/ec2-user/environment/migration_workshop/controller-config.yaml' file with your controller details and the user and password for a controller user that has 'Account Owner' role assigned.  Then set the variable that points to the 'controller-config.yaml' file like this

```
export appd_controller_details_file_path=./controller-config.yaml
```

Then run the setup script with the command below:

```
./setup_workshop.sh
```

