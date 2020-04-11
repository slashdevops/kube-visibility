# kube-visibility

This project is like kube-prometheus but instead of use jsonnet use kustomize

## Porjects used in this reppository

* [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics)
* [node_exporter](https://github.com/prometheus/node_exporter)
* [prometheus-operator](https://github.com/coreos/prometheus-operator)
* [prometheus](https://prometheus.io/docs/introduction/overview/)
* [alertmanager](https://prometheus.io/docs/alerting/alertmanager/)
* [grafana](https://grafana.com/)

## Manifests availables

Looks inside [manifest folder](#manifest)

## Generate Templates for Kubernetes

Clone the repository:

```bash
git clone https://github.com/christiangda/kube-visibility.git
cd kube-visibility/
```

Generate a unique file bundle:

```bash
kustomize build manifests/minikube-k8s-1.15 > kube-visibility.yaml
kubectl apply -f kube-visibility.yaml
```

or all in one command:

```bash
kustomize build manifests/minikube-k8s-1.15 kubectl apply -f -
```

or since kubernetes v1.14.x kustomize is integrated with kubectl

```bash
kubectl apply -k manifests/minikube-k8s-1.15
```
