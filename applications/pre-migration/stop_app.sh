#!/bin/bash

#set +x  # temporarily turn command display OFF.

cd /home/ec2-user/environment/migration_workshop/applications/pre-migration/load-generation

/bin/bash ./stop.sh

cd /home/ec2-user/environment/migration_workshop/applications/pre-migration/java-webapps

/bin/bash ./stop.sh

cd /home/ec2-user/environment/migration_workshop/applications/pre-migration/java-monolithic-services

/bin/bash ./stop.sh

