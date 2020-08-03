# kube-visibility

Work In Progress (WIP)

This project was inspired by [kube-prometheus](https://github.com/coreos/kube-prometheus) bundle but instead of use [jsonnet](https://jsonnet.org/) to customize and configure it, this use [kustomize](https://github.com/kubernetes-sigs/kustomize) to overlay [Kubernetes manifests](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/) and [kpt](https://googlecontainertools.github.io/kpt/) to distribute it as a package.

Also, this is [GitOps](https://www.weave.works/technologies/gitops/) friendly.

## Components of this bundle

This [kpt package](pkg/) will install the following software list into your Kubernetes cluster

* [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics)
* [node_exporter](https://github.com/prometheus/node_exporter)
* [prometheus-operator](https://github.com/coreos/prometheus-operator)
* [k8s-prometheus-adapter](https://github.com/DirectXMan12/k8s-prometheus-adapter)
* [prometheus](https://prometheus.io/docs/introduction/overview/)
* [alertmanager](https://prometheus.io/docs/alerting/alertmanager/)
* [grafana](https://grafana.com/)

## Kubernetes version supported

* '>=' 1.16.x

## Project Layout Structure

The layout structure for this project is simple, the [pkg folder](pkg/) contains the [kpt blueprint](https://googlecontainertools.github.io/kpt/guides/producer/blueprint/) implementation of kube-visibility, which is separate from the root of git project intentionally to avoid unnecessary files into the package when you install it using [kpt pkg get](https://googlecontainertools.github.io/kpt/guides/consumer/get/) command.
The root folder could contain additional docs, examples, and CI/CD pipeline definitions.

## Customization and packager tool

The heart of this project are these two tools, so if you want to contribute with it you need to understand and manage it.

* [kustomize](https://kubernetes-sigs.github.io/kustomize/)
* [kpt](https://googlecontainertools.github.io/kpt/)

and of course, it is was possible thanks to the big and great idea of [kube-prometheus project](https://github.com/coreos/kube-prometheus).

## How to Install

To install this [kpt package](https://googlecontainertools.github.io/kpt/) you just need to know about [KPT Package Consumers
](https://googlecontainertools.github.io/kpt/guides/consumer/), but in short:

```bash
kpt pkg get https://github.com/slashdevops/kube-visibility/pkg@master kube-visibility
```

__NOTE:__  Remember the `pkg folder` into the `git path`

## Try it on minikube

Looks inside [HowTos folder](HowTos/) for more detailed information about how to prepare minikube

### minikube setting

```bash
# set
minikube config set memory 4096 # > much better
minikube config set cpus 2      # > much better
minikube config set disk-size 40G
minikube config set vm-driver kvm2 # for linux, for MacOS see HowTos/ folder
minikube config set kubernetes-version 1.17.6
minikube config view

# start
minikube start

# check
minikube status

# OPTIONAL, EXECUTE IT IN DIFFERENT TERMINAL
# I recommended it to see what is happening inside your cluster
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:default
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep default | awk '{print $1}')
kubectl proxy
# then, open the following link in your browser: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy
```

### Download and Apply

Download and install the `kpt pkg` from `master branch` or the specify the `release tag`, more information here [Command Reference / pkg / get](https://googlecontainertools.github.io/kpt/reference/pkg/get/)

```bash
mkdir k8s-workspace
cd k8s-workspace/
kpt pkg get https://github.com/slashdevops/kube-visibility/pkg@master kube-visibility
git add .
git commit -am "added kube-visibility tool"

# OPTIONAL, using kpt live
kpt live init kube-visibility/

# OPTIONAL, list available kpt setters
kpt cfg list-setters kube-visibility/

# OPTIONAL, change one setter
kpt cfg set kube-visibility/ alertmanager.resources-limits-cpu 120m

# WORKAROUND, until kpt avoid problems with json and yaml files that not are part of k8s 'kind'
# Apply the manifest bundle to the cluster
# NOTE 1: the first time you execute this command some errors appears at the end, wait until
# prometheus-operator is up before apply again! (see the NOTE below).
# to see it, use the command 'kubectl get pod --all-namespaces' or just see in the kubernetes-dashboard (step above)
# NOTE 2: The second time you apply this command, they are take to long, because depending prometheus CRDs are big!
kustomize build kube-visibility/instance | kubectl apply -f -

# OPTIONAL, depend on 'kpt live init'
# kpt live apply kube-visibility/ --reconcile-timeout=10m
```

> __NOTE:__  The bundle of manifest generated with kustomize has some dependencies with
> each other (prometheus depends on prometheus-operator and needs that it was created first), so when you
> execute the first time the manifest, some errors will occur.
> After the first execution you need to wait until some resources were created, and then you can execute
> again the command to create the resources into the k8s cluster.
> If you are using the kubernetes-dashboard you can watch when the first execution finished creating
> the resources, and then you can execute it again to finish with the installation.

### Once installed, access to graphical tools

All these tools are accessible (using the method described below) when you follow the instructions described in [HowTos folder](HowTos/) for minikube

#### kubernetes Dashboard

```bash
# get the token
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep default | awk '{print $1}')

# Execute it in a different terminal
kubectl proxy
```

__Link:__ [Kubernetes Dashboard](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy) --> http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy

#### Prometheus Dashboard

```bash
# Execute it in a different terminal
kubectl --namespace kube-visibility port-forward svc/prometheus-visibility 9090
```

__Link:__ [prometheus](http://localhost:9090) --> http://localhost:9090

#### Alertmanager Dashboard

```bash
# Execute it in a different terminal
kubectl --namespace kube-visibility port-forward svc/alertmanager-visibility 9093
```

__Link:__ [alertmanager](http://localhost:9093) --> http://localhost:9093

#### Grafana Dashboard

```bash
# Execute it in a different terminal
kubectl --namespace kube-visibility port-forward svc/grafana 3000
```

__Link:__  [grafana](http://localhost:3000) --> http://localhost:3000

* __user:__ admin
* __password:__ admin

## Development / Contributing

WIP, but at least

If you want to contribute to this project do the following

* [Fork the project](https://help.github.com/en/github/getting-started-with-github/fork-a-repo)
* Clone the Forked repository
* Create a `custom branch` or work on `develop branch`
* Create your custom `manifests/modifiers` or `grafana dashboard` or fix some bug what did you find
* Merge and push your changes to the `custom branch` or `develop` branch in your forked repository
* Create a Pull Request to official project `develop` branch
* Wait until your `PR` to be approved and merged to the `master branch`

References

* [Fork a repo](https://help.github.com/en/github/getting-started-with-github/fork-a-repo)
* [Creating a pull request from a fork](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request-from-a-fork)

## License

This module is released under the Apache License Version 2:

* [https://www.apache.org/licenses/LICENSE-2.0](https://www.apache.org/licenses/LICENSE-2.0)

## Author Information

* [Christian González Di Antonio](https://github.com/slashdevops)
