# MacOs Minikube Howto

This recipe apply for [MacOs](https://www.apple.com/macos/catalina/) + [brew](https://brew.sh/) + [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube)

## Preparing "minikube" environment

```bash
brew update && brew upgrade
```

## Installing command line tools

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

### kubeval

```bash
brew tap instrumenta/instrumenta
brew install kubeval
kubeval --version
```

## Starting Kubernetes with minikube

### Option 1 (Stateful, config saved at ~./minikube)

This way persist configuration when making minikube stop and minikube start again

**NOTES:**

* `Set the minikube config values` and `kubernetes version` according to your needs.
* To Select the [Kubernetes versions](https://github.com/kubernetes/kubernetes/tree/master/CHANGELOG) available select the `CHANGELOG-X.Y.md` you want to use

```bash
minikube delete
minikube config set memory 6144
minikube config set cpus 2
minikube config set disk-size 40G
minikube config set vm-driver docker
minikube config set kubernetes-version 1.19.8
minikube config view

minikube start

minikube status
```

### Option 2 (Stateless, config is not saved at ~./minikube)

```bash
minikube start \
 --kubernetes-version v1.19.8 \
 --vm-driver=docker \
 --memory=6144 \
 --cpus=2 \
 --disk-size=40G

minikube status
```

## Install kubernetes dashboard

Reference: https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml
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

**NOTE:** First you need to get the token (Secret) of the `default ServiceAccount of kube-system namespace`

```bash
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep default | awk '{print $1}')
```

```bash
kubectl proxy
```

After execute `kubectl proxy` got this link [Kubernetes Dashboard](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy)