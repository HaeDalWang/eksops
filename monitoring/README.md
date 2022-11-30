## 구성
storageclass: gp2
ingress: ingress-nginx(NLB), TLS종료
hosts: 개인

## 사용
kubectl create namespace monitoring

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm upgrade -i -n monitoring monitoring \
prometheus-community/kube-prometheus-stack \
-f values.yaml

