#!/bin/bash

export ARGO_USER=admin
export ARGO_PWD=$(kubectl -n argocd get secrets argocd-initial-admin-secret -o json | jq -r .data.password | base64 -d)
export ARGOCD_SERVER=$(kubectl get svc argocd-server -n argocd -o json | jq --raw-output '.status.loadBalancer.ingress[0].hostname')

echo "ID: $ARGO_USER"
echo "PWD: $ARGO_PWD"
echo "Use Login Command!"
echo "argocd login $ARGOCD_SERVER --username $ARGO_USER --password $ARGO_PWD --insecure "
echo ""
