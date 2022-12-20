# 구성

변수 파일 수정 사항

Share

- defaultRules-true: System, Storage, k8s, node, app
- ComponentScraping: kubelet, kubeStateMetrics, nodeExporter
- storageclass: gp3, 전부 20Gi
- ingressclass: alb, TLS종료(443-redirect)
    + group.name: "monitoring-alb-group"
    + hosts: 개인 (51bsd.click)
    + grfana, prometheus, alertmanager, thanos(x)

Prometheus

- disableCompaction: true
- retention: 6h
<!-- - ruleSelectorNilUsesHelmValues: false -->
- podMonitorSelectorNilUsesHelmValues: false
- serviceMonitorSelectorNilUsesHelmValues: false
    + 모든 namespace의 메트릭을 수집함으로 프로덕션환경에는 부적합
    + 운영설치시 matchLabels등으로 지정하여 사용

Grafana

- defaultDashboardsTimezone: kst
- user/pass: admin/test123
- sidecar.defaultDatasourceEnabled: false
- servicemonitor: false

alertmanager

- serviceMonitor.selfmonitor: false

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
kubectl delete ns monitoring --grace-period 0 --force 
```
