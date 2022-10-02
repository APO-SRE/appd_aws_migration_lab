#!/bin/bash


#set +x  # temporarily turn command display OFF.
echo "##############################################################################################################################################################"
echo " Start Installing Workshop Prerequisite Software"
echo "##############################################################################################################################################################"
echo ""


#sudo /bin/bash 

./scripts/resize_al2_ebs_volume.sh

./scripts/install_kubectl.sh

./scripts/install_eksctl.sh

./scripts/install_helm_cli.sh

./scripts/install_ec2_metadata_utils.sh

./scripts/install_docker_compose.sh

./scripts/install_al2_mariadb_community_server_10.sh

sudo /bin/bash ./scripts/install_al2_mongodb_community_server_5.sh


echo "##############################################################################################################################################################"
echo " Finished Installing Workshop Prerequisite Software"
echo "##############################################################################################################################################################"
echo ""