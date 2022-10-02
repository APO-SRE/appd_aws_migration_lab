#!/bin/bash

#set +x  # temporarily turn command display OFF.

/bin/bash ./home/ec2-user/environment/migration_workshop/applications/pre-migration/load-generation/stop.sh

/bin/bash ./home/ec2-user/environment/migration_workshop/applications/pre-migration/java-webapps/stop.sh

/bin/bash ./home/ec2-user/environment/migration_workshop/applications/pre-migration/java-monolithic-services/stop.sh

