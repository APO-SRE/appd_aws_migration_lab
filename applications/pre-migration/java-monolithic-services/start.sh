#!/bin/sh -eux

source ../.env/setenv.sh

if [ -f nohup.out ]; then
  rm nohup.out
fi

nohup java -javaagent:/opt/appdynamics/javaagent/ver22.3.0.33637/javaagent.jar -Dappagent.install.dir=/opt/appdynamics/javaagent/ver22.3.0.33637 -Dappdynamics.agent.tierName=FinancialServices -Dappdynamics.agent.nodeName=FinancialServices-Node-1 -Dserver.port=8081 -jar AD-Financial-Monolithic-1.0.0.jar &
