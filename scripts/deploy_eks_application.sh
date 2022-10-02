#!/bin/bash

./get_ips_for_cloud_db_security_group.sh

##### Update RDS security group with EKS IPs





##### Deploy application to EKS

cd ..
cd applications
cd post-migration
cd application
cd .env

kubectl create -f ./config-map.yaml

cd ..

kubectl create -f ./balance-services.yaml
kubectl create -f ./biz-loan-services.yaml
kubectl create -f ./per-loan-services.yaml
kubectl create -f ./account-management.yaml
kubectl create -f ./mongo-policies.yaml
kubectl create -f ./policy-services.yaml
kubectl create -f ./session-tracking.yaml
kubectl create -f ./authentication-services.yaml
kubectl create -f ./mongo-orders.yaml
kubectl create -f ./order-processing.yaml
kubectl create -f ./mongo-stocks.yaml
kubectl create -f ./quote-services.yaml
kubectl create -f ./web-front-end.yaml
kubectl create -f ./biz-loan-load-01.yaml
kubectl create -f ./browser-load.yaml
kubectl create -f ./per-loan-load-01.yaml


# Wait 30 seconds : 30 secs
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .............................................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..........................................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .........................................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ....................................................."
sleep 3
# Wait 30 seconds : 1 min
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ...................................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..................................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .................................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..............................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .............................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..........................................."
sleep 3
# Wait 30 seconds : 1.5 mins
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .........................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ....................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ...................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .................................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................."
sleep 3
# Wait 30 seconds : 2 mins
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..............................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .............................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..........................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .........................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ........................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................."
sleep 3
# Wait 30 seconds : 2.5 mins
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ......................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ....................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ...................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ................"
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ..............."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize .............."
sleep 3
echo "CloudWorkshop|INFO|     - Waiting for Application to Initialize ............."
sleep 3
# Wait 30 seconds : 3 mins
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
echo "CloudWorkshop|INFO| - Finished Deploying Application to EKS"

