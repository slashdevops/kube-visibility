# kube-visibility

This project is like kube-prometheus but instead of use jsonnet use kustomize

## Porjects used in this reppository

* [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics)


## Generate Templates for Kubernetes

Generate a unique file bundle:

```bash
kustomize build environment/minikube/k8s-1.15 > kube-visibility.yaml
```

Applaying it to my cluster

```bash
kubectl apply -f kube-visibility.yaml
```

or since kubernetes v1.14.x kustomize is integrated with kubectl

```bash
kubectl apply -k environment/minikube/k8s-1.15
```
