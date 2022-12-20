eksctl create iamserviceaccount --name external-dns \
--namespace kube-system --cluster my-cluster \
--attach-policy-arn arn: \
--approve

배포 버전 확인
policy 배포 후 irsa 진행
sa 꼭 role 연결 확인
sa 랑 deployment ns 맞출것 끝
