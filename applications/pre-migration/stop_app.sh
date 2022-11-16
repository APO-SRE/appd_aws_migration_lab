#!/bin/bash

#set +x  # temporarily turn command display OFF.

input_7="${input_7:-Welcome1!}"

cd /home/ec2-user/environment/migration_workshop/applications/pre-migration/load-generation

/bin/bash ./stop.sh

cd /home/ec2-user/environment/migration_workshop/applications/pre-migration/java-webapps

/bin/bash ./stop.sh

cd /home/ec2-user/environment/migration_workshop/applications/pre-migration/java-monolithic-services

/bin/bash ./stop.sh


cd /home/ec2-user/environment/migration_workshop/applications/pre-migration

mysql -u root -p${input_7} < drop_schemas.sql
