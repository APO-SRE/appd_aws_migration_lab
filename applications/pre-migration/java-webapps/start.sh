#!/bin/sh -eux

set +x  # temporarily turn command display OFF.

source ../.env/setenv.sh

if [ -f nohup.out ]; then
  rm nohup.out
fi

nohup java -javaagent:/opt/appdynamics/javaagent/ver22.3.0.33637/javaagent.jar -Dappagent.install.dir=/opt/appdynamics/javaagent/ver22.3.0.33637 -Dappdynamics.agent.tierName=WebFrontEnd -Dappdynamics.agent.nodeName=WebFrontEnd-Node-1 -Dserver.port=8080 -jar AD-Financial-Web-1.0.0.war &
