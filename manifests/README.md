# Manifests

## Descriptions

| Manifest Folder   | Description                                                      | Notes |
| ----------------- | :--------------------------------------------------------------- | :---- |
| minikube-k8s-1.14 | Designed to be used with minikube with kubernetes version 1.14.x |       |
| minikube-k8s-1.15 | Designed to be used with minikube with kubernetes version 1.15.x |       |
| minikube-k8s-1.16 | Designed to be used with minikube with kubernetes version 1.16.x |       |

## Generating Kubernetes manifests from templates

Clone the repository

```bash
git clone https://github.com/christiangda/kube-visibility.git
cd kube-visibility/
```

Generate a unique file bundle

```bash
kustomize build manifests/minikube-k8s-1.15 > kube-visibility.yaml
kubectl apply -f kube-visibility.yaml
```

or all in one command:

```bash
kustomize build manifests/minikube-k8s-1.15 | kubectl apply -f -
```
