#!/bin/bash

# Namespace and deployemnt 
``` bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.5.2/manifests/install.yaml
```

## argocd CLI
``` bash
sudo curl --silent --location -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v2.5.2/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd
```

### expose
``` bash
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

## delete
``` bash
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.5.2/manifests/install.yaml
kubectl delete ns argocd
```