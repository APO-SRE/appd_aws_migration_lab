#!/bin/bash

#set +x  # temporarily turn command display OFF.

source ../.env/setenv.sh

if [ -f nohup.out ]; then
  rm nohup.out
fi

nohup java -javaagent:/opt/appdynamics/javaagent/javaagent.jar -Dappagent.install.dir=/opt/appdynamics/javaagent -Dappdynamics.agent.tierName=WebFrontEnd -Dappdynamics.agent.nodeName=WebFrontEnd-Node-1 -Dserver.port=8080 -jar AD-Financial-Web-1.0.0.war &
