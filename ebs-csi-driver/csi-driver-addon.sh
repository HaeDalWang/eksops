#!/bin/bash

ACCOUNTID=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .accountId)

echo "===== IRSA ====="
echo ""
eksctl create iamserviceaccount \
--name ebs-csi-controller-sa \
--namespace kube-system \
--cluster my-cluster \
--attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
--override-existing-serviceaccounts \
--approve

echo "===== CSI-Driver Added ====="
echo ""
eksctl create addon --name aws-ebs-csi-driver --cluster my-cluster --service-account-role-arn arn:aws:iam::${ACCOUNTID}:role/AmazonEKS_EBS_CSI_DriverRole --force

echo "===== ServiceAccount =====" 
echo "" 
kubectl get sa -n kube-system ebs-csi-controller-sa -o yaml

echo "===== Result Addon =====" 
echo "" 
eksctl get addon --cluster my-cluster | grep csi