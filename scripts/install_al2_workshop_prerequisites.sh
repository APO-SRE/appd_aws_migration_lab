#!/bin/sh -eux


set +x  # temporarily turn command display OFF.
echo "##############################################################################################################################################################"
echo " Start Installing Workshop Prerequisite Software"
echo "##############################################################################################################################################################"
echo ""


#sudo /bin/bash 

./resize_al2_ebs_volume.sh

./install_kubectl.sh

./install_eksctl.sh

./install_helm_cli.sh

./install_ec2_metadata_utils.sh

./install_docker_compose.sh

./install_al2_mariadb_community_server_10.sh

sudo /bin/bash ./install_al2_mongodb_community_server_5.sh


echo "##############################################################################################################################################################"
echo " Finished Installing Workshop Prerequisite Software"
echo "##############################################################################################################################################################"
echo ""