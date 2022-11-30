오퍼레이터 설치
```
istioctl operator init 
```
istio 설치 Namespace: istio-system
Namespace 명을 바꿔야 할 경우 --watchedNamespaces=<namespace> 옵션 추가

오퍼레이터을 이용하여 설치
```
kubectl apply -f istio-operator.yaml
```

istio 인젝션을 Namespace 라벨에 적용
```
kubectl label namespace <namespace> istio-injection=enable
kubectl get ns <namespace> --show-labels
```

AWS alb로 노출
```
kubectl apply -f ingress-alb.yaml
```
