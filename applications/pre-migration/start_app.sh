#!/bin/bash

#set +x  # temporarily turn command display OFF.

find ./ -type f -iname "*.sh" -exec chmod +x {} \;

cd /home/ec2-user/environment/migration_workshop/applications/pre-migration/java-monolithic-services

/bin/bash ./start.sh

sleep 3

# Wait 30 seconds
echo "CloudWorkshop|INFO| - Deploying FinancialServices Tier ......................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..........."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .........."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ....."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ...."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..."
sleep 3
echo "CloudWorkshop|INFO| - Finished Deploying FinancialServices Tier"

cd /home/ec2-user/environment/migration_workshop/applications/pre-migration/java-webapps

/bin/bash ./start.sh

sleep 3

# Wait 30 seconds
echo "CloudWorkshop|INFO| - Deploying WebFrontEnd Tier ............................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..........."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .........."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ....."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ...."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..."
sleep 3
echo "CloudWorkshop|INFO| - Finished Deploying WebFrontEnd Tier"

cd /home/ec2-user/environment/migration_workshop/applications/pre-migration/load-generation

/bin/bash ./start.sh



# we are waiting for 11 minutes so that the flowmap will completely generate all the components before we attampt to ungroup and rename them
echo "CloudWorkshop|INFO| - Deploying Load Generator .................................................................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................................................................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..............................................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .............................................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................................................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..........................................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .........................................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................................................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................................................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ....................................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ...................................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..................................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .................................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................................................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..............................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .............................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..........................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .........................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ....................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ...................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..............................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .............................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..........................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .........................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ....................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ...................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..............................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .............................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..........................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .........................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ....................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ...................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..............................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .............................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..........................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .........................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ....................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ...................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..............................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .............................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..........................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .........................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ....................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ...................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..............."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .............."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..........."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .........."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......"
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ....."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ...."
sleep 6
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..."
sleep 6
echo "CloudWorkshop|INFO| - Finished Deploying Load Generator"

