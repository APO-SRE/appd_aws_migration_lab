#!/bin/bash

if [ ! -d ./state ]; then
  mkdir state
fi


##### Get the public IP address for the local host and store in file

#ec2-metadata -v | awk '{print $2}' > ./state/localpubip.txt

if [ -f ./state/localpubip.txt ]; then
  mv ./state/localpubip.txt ./state/localpubip.txt.old
  ec2-metadata -v | awk '{print $2}' > ./state/localpubip.txt
else
  ec2-metadata -v | awk '{print $2}' > ./state/localpubip.txt
  cp ./state/localpubip.txt ./state/localpubip.txt.old
fi


##### Get the private IP address for the local host and store in file

#ec2-metadata -o | awk '{print $2}' > ./state/localprivip.txt

if [ -f ./state/localprivip.txt ]; then
  mv ./state/localprivip.txt ./state/localprivip.txt.old
  ec2-metadata -o | awk '{print $2}' > ./state/localprivip.txt
else
  ec2-metadata -o | awk '{print $2}' > ./state/localprivip.txt
  cp ./state/localprivip.txt ./state/localprivip.txt.old
fi


##### Get the public IP addresses for the Kubernetes worker nodes and store in file

#kubectl get nodes -o wide | awk '/ip-/ {print $7}' > ./state/clusterpubips.txt

if [ -f ./state/clusterpubips.txt ]; then
  mv ./state/clusterpubips.txt ./state/clusterpubips.txt.old
  kubectl get nodes -o wide | awk '/ip-/ {print $7}' > ./state/clusterpubips.txt
else
  kubectl get nodes -o wide | awk '/ip-/ {print $7}' > ./state/clusterpubips.txt
  cp ./state/clusterpubips.txt ./state/clusterpubips.txt.old
fi


##### Get the private IP addresses for the Kubernetes worker nodes and store in file

#kubectl get nodes -o wide | awk '/ip-/ {print $6}' > ./state/clusterprivips.txt

if [ -f ./state/clusterprivips.txt ]; then
  mv ./state/clusterprivips.txt ./state/clusterprivips.txt.old
  kubectl get nodes -o wide | awk '/ip-/ {print $6}' > ./state/clusterprivips.txt
else
  kubectl get nodes -o wide | awk '/ip-/ {print $6}' > ./state/clusterprivips.txt
  cp ./state/clusterprivips.txt ./state/clusterprivips.txt.old
fi
