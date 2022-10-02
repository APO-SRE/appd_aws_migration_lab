#!/bin/bash

#set +x  # temporarily turn command display OFF.
echo "####################################################################################################"
echo " Start Installing Helm"
echo "####################################################################################################"
echo ""

sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/APO-SRE/fso-lab-devops/main/provisioners/scripts/common/install_helm_cli.sh)"

echo ""
echo "####################################################################################################"
echo " Finished Installing Helm"
echo "####################################################################################################"
echo ""
