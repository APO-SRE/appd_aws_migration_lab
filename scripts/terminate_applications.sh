#!/bin/bash

sudo pkill -f db-agent.jar

sudo pkill -f machineagent.jar

#echo "CloudWorkshop|INFO| - Undeploying AppDynamics Agents from EKS"
#echo " "

#./undeploy_appd_agents_from_kubernetes.sh

#echo "CloudWorkshop|INFO| - Finished Undeploying AppDynamics Agents from EKS"
#echo " "


echo "CloudWorkshop|INFO| - Stopping Local Application"
echo " "

cd /home/ec2-user/environment/migration_workshop/applications/pre-migration

/bin/bash ./stop_app.sh

echo " "
echo "CloudWorkshop|INFO| - Finished Stopping Local Application"
echo " "



#echo "CloudWorkshop|INFO| - Stopping EKS Application"
#echo " "

#cd ..
#cd post-migration
#cd application

echo " "
echo "CloudWorkshop|INFO| - Starting EKS Cluster Deletion"
echo " "

cd /home/ec2-user/environment/migration_workshop/applications/post-migration

eksctl delete cluster -f ./cluster.yaml

echo " "
echo "CloudWorkshop|INFO| - Finished EKS Cluster Deletion"
echo " "
