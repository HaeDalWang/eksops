# CLI Tools

## kubectl
```
curl -LO https://dl.k8s.io/release/v1.25.0/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

## eksctl
```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin
```

## helm
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

## jq
```
sudo curl -L https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o /usr/local/bin/jq
sudo chmod a+x /usr/local/bin/jq
jq -V
```

## yq
```
YQ_VERSION=v4.13.0
BINARY=yq_linux_amd64
curl -L https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/${BINARY} -o yq
chmod +x yq
sudo mv yq /usr/local/bin/
```

## Terraform
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
terraform -install-autocomplete

## Bash completion

source <(kubectl completion bash)
source <(helm completion bash)
source <(eksctl completion bash)
# source <(istioctl completion bash)
<!-- source /etc/profile.d/bash_completion.sh  -->