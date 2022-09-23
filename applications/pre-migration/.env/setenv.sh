#!/bin/sh -eux

export APPDYNAMICS_CONTROLLER_HOST_NAME=channel.saas.appdynamics.com
export APPDYNAMICS_CONTROLLER_PORT=443
export APPDYNAMICS_CONTROLLER_SSL_ENABLED=true
export APPDYNAMICS_AGENT_APPLICATION_NAME=AD-Financial-Monolithic
export EVENT_ENDPOINT=analytics.api.appdynamics.com:443
export APPDYNAMICS_AGENT_ACCOUNT_NAME=channel
export APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY=${ADWRKSHP_ACCT_ACCESS_KEY}
export APPDYNAMICS_EUM_HOST=pdx-col.eum-appdynamics.com
export APPDYNAMICS_EUM_APP_NAME=AD-Financial-Monolithic-Web
export APPDYNAMICS_EUM_KEY=AD-AAB-ABS-JNS
export APPDYNAMICS_DB_AGENT_NAME=adfin-migration-db-agent
export MYSQL_DB_URL=jdbc:mysql://localhost:3306
export LOADGEN_HOSTNAME=localhost
export LOADGEN_BASEURL=/rest
export LOADGEN_PORT=8080
export ADWRKSHP_CLOUD_MODE=none
export ADWRKSHP_LABUSER_KEY=whocares
export ADWRKSHP_IS_MONOLITHIC=true
export ADWRKSHP_APP_GRAPH_PATH=/home/ec2-user/environment/monoapp/java-monolithic-services/app-graph.json
export ADWRKSHP_TIER_SRVC_NAME=FinancialServices
export REPOS_CONFIG_FILE=/home/ec2-user/environment/monoapp/java-monolithic-services/repos-config.yaml

export ADWRKSHP_ACCOUNT_MANAGEMENT_URL=http://localhost:8081/accounts/api/
export ADWRKSHP_AUTH_SRVCS_URL=http://localhost:8081/auth/api/
export ADWRKSHP_ORDER_PROCESSING_URL=http://localhost:8081/orders/api/
export ADWRKSHP_QUOTE_SRVCS_URL=http://localhost:8081/quotes/api/
