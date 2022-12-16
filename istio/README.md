# istio
CLI or Helm

## istioctl
```
echo 'export ISTIO_VERSION="1.16.0"' >> ${HOME}/.bash_profile
source ${HOME}/.bash_profile

curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${ISTIO_VERSION} sh -

cd ${HOME}/environment/istio-${ISTIO_VERSION}

sudo cp -v bin/istioctl /usr/local/bin/

istioctl version
```

## 오퍼레이터 설치 명령
``` bash
istioctl operator init 
```

설치 Namespace 변경시(기본값: istio-system)
``` bash
istioctl operator init --watchedNamespaces=<namespace>
```
## 오퍼레이터 설치 헬름
```
cd ${HOME}/environment/istio-${ISTIO_VERSION}/manifests/charts/
kubectl create ns istio-operator

helm install istio-operator ./istio-operator/ -n istio-operator 
```

## istio 배포

Profile 변경값(base: default)
- istioingressGateway: Loadbalancer -> NodePort

배포 
``` bash
istioctl install -f profile.yaml 
```

## istioGateway alb(tls)

``` bash
kubectl apply -f istio-ingressgateway-alb-ingress.yaml
```


