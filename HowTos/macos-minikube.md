# MacOs Minikube Howto

This receipe apply for [MacOs](https://www.apple.com/macos/catalina/) + [brew](https://brew.sh/) + [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube)

## Preparing "minikube" environment

```bash
brew update
brew upgrade
```

## Instaling command line tools

### minikube

```bash
brew install minikube
minikube version
```

### kubectrl

```bash
brew install kubectl
kubectl version
```

### kustomize

```bash
brew install kustomize
kustomize version
```

## Starting Kubernetes with minikube

### Option 1 (Stateful, config saved at ~./minikube)

This way persist configuration when making minikube stop and minikube start again

**NOTE:** `Set the minikube config values` and `kubernetes version` according to your needs

```bash
minikube config set memory 4096
minikube config set cpus 2
minikube config set disk-size 40G
minikube config set vm-driver kvm2
minikube config set kubernetes-version 1.15.10
minikube config view

minikube start

minikube status
```

### Option 2 (Stateless, config is not saved at ~./minikube):

```bash
minikube start \
 --kubernetes-version v1.15.10 \
 --vm-driver=kvm2 \
 --memory=4096 \
 --cpus=2 \
 --disk-size=40G

minikube status
```

## Install kubernetes dashboard

Reference: https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml
```

### Create a RoleBinding for ServiceAccount

Create a RoleBinding to `kube-system namespace default ServiceAccount` to access to the dashboard as ClusterAdmin

```bash
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:default
```

### Check the running pods

Running pods in all Namespaces

```bash
kubectl get pods --all-namespaces
```

### Access to Kubernetes Dashboard

```bash
kubectl proxy
```
**NOTE:** First you need to get the token (Secret) of the `default ServiceAccount of kube-system namespace`

```bash
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep default | awk '{print $1}')
```

After execute `kubectl proxy` got this link [Kubernetes Dashboard](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy)
