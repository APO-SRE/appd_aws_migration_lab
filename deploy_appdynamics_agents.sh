#!/bin/bash

#
# Script to deploy AppDynamics Agents to two different Kubernetes clusters using a Helm chart.
# This script uses the AD-Workshop-Utils.jar to perform the deployment with elevated permissions.
#
# The Helm chart is configured to deploy the following agent types:
#
# - Cluster Agent
# - Java Agent
# - ServerMonitoring Agent
# - NetViz Agent
#

#cd ..
#cd applications
#cd post-migration
#cd clusteragent


appd_wrkshp_last_setupstep_done="100"

java -DworkshopUtilsConf=./applications/post-migration/clusteragent/agent-setup.yaml -DworkshopAction=elevatedinstall -DlastSetupStepDone=${appd_wrkshp_last_setupstep_done} -DshowWorkshopBanner=false -jar ./AD-Workshop-Utils.jar

#rm -f ./applications/post-migration/clusteragent/values-ca1.yaml
