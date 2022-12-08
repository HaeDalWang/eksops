## 
``` bash
istioctl operator init 
```

설치 Namespace 변경시(기본값: istio-system)
``` bash
istioctl operator init --watchedNamespaces=<namespace>
```

## 

Profile 변경값
- istioingressGateway: Loadbalancer -> NodePort

배포 
``` bash
istioctl install -f profile.yaml 
```

## istioGateway alb(tls)

``` bash
kubectl apply -f istio-ingressgateway-alb-ingress.yaml
```

### kiali addon
```
kubectl apply -f kiali.yaml
```


