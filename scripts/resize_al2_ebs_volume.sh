#!/bin/sh -eux

set +x  # temporarily turn command display OFF.

echo "####################################################################################################"
echo " Start Resizing Local EBS Volume"
echo "####################################################################################################"
echo ""

SIZE=${1:-80}

#echo "CloudWorkshop|INFO|     - Updating something ..."

echo "#########################################"
echo " Resizing Volume To" $SIZE "GB"
echo "#########################################"


echo ""

INSTANCEID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
REGION=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed 's/\(.*\)[a-z]/\1/')

#echo "INSTANCEID =" $INSTANCEID
#echo "REGION =" $REGION

VOLUMEID=$(aws ec2 describe-instances \
  --instance-id $INSTANCEID \
  --query "Reservations[0].Instances[0].BlockDeviceMappings[0].Ebs.VolumeId" \
  --output text \
  --region $REGION)


#echo "VOLUMEID =" $VOLUMEID

aws ec2 modify-volume --region $REGION --volume-id $VOLUMEID --size $SIZE

while [ \
  "$(aws ec2 describe-volumes-modifications \
    --volume-id $VOLUMEID \
    --region $REGION \
    --filters Name=modification-state,Values="optimizing","completed" \
    --query "length(VolumesModifications)"\
    --output text)" != "1" ]; do
sleep 1
done

if [[ -e "/dev/xvda" && $(readlink -f /dev/xvda) = "/dev/xvda" ]]
then
  sudo growpart /dev/xvda 1

  STR=$(cat /etc/os-release)
  SUB="VERSION_ID=\"2\""
  if [[ "$STR" == *"$SUB"* ]]
  then
    sudo xfs_growfs -d /
  else
    sudo resize2fs /dev/xvda1
  fi

else
  sudo growpart /dev/nvme0n1 1

  STR=$(cat /etc/os-release)
  SUB="VERSION_ID=\"2\""
  if [[ "$STR" == *"$SUB"* ]]
  then
    sudo xfs_growfs -d /
  else
    sudo resize2fs /dev/nvme0n1p1
  fi
fi

echo ""
df -H
echo ""
echo "####################################################################################################"
echo " Finished Resizing Local EBS Volume"
echo "####################################################################################################"
echo ""
