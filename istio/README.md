## 오퍼레이터 설치
``` bash
istioctl operator init 
```

설치 Namespace 변경시(기본값: istio-system)
``` bash
istioctl operator init --watchedNamespaces=<namespace>
```

## 오퍼레이터을 이용하여 설치

Profile 변경값
- istioingressGateway: Loadbalancer -> NodePort

배포 
``` bash
istioctl install -f profile.yaml 
```

## istioGateway alb(tls) 배포
배포전 파일 복사후 값 수정
- cert의 Arn
``` bash
kubectl apply -f istio-ingressgateway-alb-ingress.yaml
```

### kiali addon
```
kubectl apply -f kiali.yaml
```


