# base

This folder containg the manifest files from the original project

## Install prerequisites

### MacOS

```bash
brew install minikube
brew install kubectl
brew install kustomize
brew install fluxctl
brew install curl
brew install jq
```

## Install kube-state-metrics

Install [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics)

```bash
RELEASE_VERION_URL="https://api.github.com/repos/kubernetes/kube-state-metrics/releases/latest"
LATEST_VERION=$(curl --silent $RELEASE_VERION_URL | jq -r .tag_name)

mkdir -p base/kube-state-metrics
cd base/kube-state-metrics
curl --remote-name --remote-header-name https://raw.githubusercontent.com/kubernetes/kube-state-metrics/${LATEST_VERION}/examples/autosharding/cluster-role-binding.yaml
curl --remote-name --remote-header-name https://raw.githubusercontent.com/kubernetes/kube-state-metrics/${LATEST_VERION}/examples/autosharding/cluster-role.yaml
curl --remote-name --remote-header-name https://raw.githubusercontent.com/kubernetes/kube-state-metrics/${LATEST_VERION}/examples/autosharding/role-binding.yaml
curl --remote-name --remote-header-name https://raw.githubusercontent.com/kubernetes/kube-state-metrics/${LATEST_VERION}/examples/autosharding/role.yaml
curl --remote-name --remote-header-name https://raw.githubusercontent.com/kubernetes/kube-state-metrics/${LATEST_VERION}/examples/autosharding/service-account.yaml
curl --remote-name --remote-header-name https://raw.githubusercontent.com/kubernetes/kube-state-metrics/${LATEST_VERION}/examples/autosharding/service.yaml
curl --remote-name --remote-header-name https://raw.githubusercontent.com/kubernetes/kube-state-metrics/${LATEST_VERION}/examples/autosharding/statefulset.yaml

kustomize create --autodetect --recursive

cd ../../
git add .
git commit -am "added kube-state-metrics project"
git push

unset RELEASE_VERION_URL LATEST_VERION
```

## Install Prometheus Operator

[prometheus-operator](https://github.com/coreos/prometheus-operator)

```bash
RELEASE_VERION_URL="https://api.github.com/repos/coreos/prometheus-operator/releases/latest"
LATEST_VERION=$(curl --silent $RELEASE_VERION_URL | jq -r .tag_name)

mkdir -p base/prometheus-operator
cd base/prometheus-operator
curl --remote-name --remote-header-name https://raw.githubusercontent.com/coreos/prometheus-operator/${LATEST_VERION}/bundle.yaml

kustomize create --autodetect --recursive

cd ../../
git add .
git commit -am "added prometheus-operator project"
git push
```

## node-exporter

[node_exporter](https://github.com/prometheus/node_exporter)

```bash
RELEASE_VERION_URL="https://api.github.com/repos/coreos/prometheus-operator/releases/latest"
LATEST_VERION=$(curl --silent $RELEASE_VERION_URL | jq -r .tag_name)

mkdir -p base/node_exporter
cd base/node_exporter
curl --remote-name --remote-header-name https://raw.githubusercontent.com/coreos/kube-prometheus/master/manifests/node-exporter-clusterRole.yaml
curl --remote-name --remote-header-name https://raw.githubusercontent.com/coreos/kube-prometheus/master/manifests/node-exporter-clusterRoleBinding.yaml
curl --remote-name --remote-header-name https://raw.githubusercontent.com/coreos/kube-prometheus/master/manifests/node-exporter-daemonset.yaml
curl --remote-name --remote-header-name https://raw.githubusercontent.com/coreos/kube-prometheus/master/manifests/node-exporter-service.yaml
curl --remote-name --remote-header-name https://raw.githubusercontent.com/coreos/kube-prometheus/master/manifests/node-exporter-serviceAccount.yaml
curl --remote-name --remote-header-name https://raw.githubusercontent.com/coreos/kube-prometheus/master/manifests/node-exporter-serviceMonitor.yaml

kustomize create --autodetect --recursive

cd ../../
git add .
git commit -am "added node_exporter project"
git push
```