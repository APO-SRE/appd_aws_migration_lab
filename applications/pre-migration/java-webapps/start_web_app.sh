#!/bin/sh -eux

source ../setenv.sh

# rm nohup.out

nohup java -javaagent:/opt/appdynamics/javaagent/ver22.3.0.33637/javaagent.jar -Dappagent.install.dir=/opt/appdynamics/javaagent/ver22.3.0.33637 -Dappdynamics.agent.tierName=WebFrontEnd -Dappdynamics.agent.nodeName=WebFrontEnd-Node-1 -Dserver.port=8080 -jar AD-Financial-Web-1.0.0.war &
