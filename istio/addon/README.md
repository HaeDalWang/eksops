# Kiali

## 오퍼레이터 설치 헬름
```
helm repo add kiali https://kiali.org/helm-charts
helm repo update kiali

helm install \
    --namespace kiali-operator \
    --create-namespace \
    kiali-operator \
    kiali/kiali-operator
```

## 배포
```
kubectl apply -f kiali-cr.yaml
```

## Kiali-cr.yaml
- Grafana Auth: basic, admin,test123
- trasing: false
- accessible_namespaces: ["**"]
- ingress: true
    - alb,tls termination
