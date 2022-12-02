## 구성
변수 파일 수정 사항
- name,namesapce: monitoring
- storageclass: gp2, 전부 20Gi
- ingres-controller 지정: ingress-nginx(NLB), TLS종료
- hosts: 개인 (51bsd.click)
    + grfana, prometheus

- Grafana defaultDashboardsTimezone: kst
- Grafana user/pass: admin/test123
- serviceMonitorSelector: matchlabels -> release: istio
- podMonitorSelector: matchlabels -> release: istio

## 사용

네임스페이스 생성
``` bash
kubectl create namespace monitoring
``` 

레포 추가 및 업데이트
``` bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

변수 적용 설치/업그레이드 진행
``` bash
helm upgrade -i -n monitoring monitoring \
prometheus-community/kube-prometheus-stack \
-f values.yaml
```

## 제거
``` bash
helm uninstall monitoring -n monitoring 
```