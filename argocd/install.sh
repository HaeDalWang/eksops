#!/bin/bash

echo "======= Namespace and deployemnt ======="
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.5.2/manifests/install.yaml
echo ""
echo "======= Argo CLI install ========"
sudo curl --silent --location -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v2.5.2/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd
echo ""
# echo "======= expose LoadBalancer ======="
# kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
