#!/bin/bash

ACCOUNTID=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .accountId)
CLUSTERNAME=$(kubectl config current-context | awk -F: '{print $6}' | awk -F/ '{print $2}')

echo "===== IRSA ====="
eksctl create iamserviceaccount \
--name ebs-csi-controller-sa \
--namespace kube-system \
--cluster my-cluster \
--attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
--override-existing-serviceaccounts \
--approve

echo "===== CSI-Driver Added ====="
eksctl create addon --name aws-ebs-csi-driver --cluster ${CLUSTERNAME} --service-account-role-arn arn:aws:iam::${ACCOUNTID}:role/AmazonEKS_EBS_CSI_DriverRole --force

echo "===== ServiceAccount ====="
kubectl get sa -n kube-system ebs-csi-controller-sa -o yaml

echo "===== Result Addon ====="
eksctl get addon --cluster my-cluster | grep csi