# Fedora Minikube Howto

This recipe apply for [Fedora 32](https://getfedora.org/) + [Linux KVM](https://www.linux-kvm.org/page/Main_Page) + [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube)

## Preparing "minikube" environment

```bash
sudo dnf -y install @virtualization
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo systemctl status libvirtd.service
sudo usermod -a -G libvirt $(whoami)
sudo usermod -a -G kvm $(whoami)
newgrp libvirt
newgrp kvm
```

## Installing command line tools

### minikube

```bash
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x ./minikube
sudo mv ./minikube /usr/local/bin/minikube

minikube version
```

### kubectrl

```bash
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

kubectl version
```

### kustomize

```bash
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
chmod +x ./kustomize
sudo mv ./kustomize /usr/local/bin/kustomize

kustomize version
```

### kubeval

```bash
wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz
tar xf kubeval-linux-amd64.tar.gz
chmod +x ./kubeval
sudo mv ./kubeval /usr/local/bin/
rm -rf kubeval-linux-amd64.tar.gz

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
minikube config set vm-driver kvm2
minikube config set kubernetes-version 1.19.8
minikube config view

minikube start

minikube status
```

### Option 2 (Stateless, config is not saved at ~./minikube)

```bash
minikube start \
 --kubernetes-version v1.19.8 \
 --vm-driver=kvm2 \
 --memory=6144 \
 --cpus=2 \
 --disk-size=40G

minikube status
```

## Install kubernetes dashboard

Reference: https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml```

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