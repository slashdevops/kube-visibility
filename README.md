# kube-visibility

This project was inspired by [kube-prometheus](https://github.com/coreos/kube-prometheus) which is great but:
* It is a little complicated to configure in a custom way because It is also using [jsonnet](https://jsonnet.org/) as a data templating language, which is very hard to understand and apply
* You don't know exactly the version available ( they don't manage releases) and this complicates the  compatibility with your kubernetes version

The idea of this project is to use [kustomize](https://github.com/kubernetes-sigs/kustomize) tool which is incredibly amazing and easy to use to create manifest overlays for [kubernetes](https://kubernetes.io)

## Projects used in this repository

* [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics)
* [node_exporter](https://github.com/prometheus/node_exporter)
* [prometheus-operator](https://github.com/coreos/prometheus-operator)
* [k8s-prometheus-adapter](https://github.com/DirectXMan12/k8s-prometheus-adapter)
* [prometheus](https://prometheus.io/docs/introduction/overview/)
* [alertmanager](https://prometheus.io/docs/alerting/alertmanager/)
* [grafana](https://grafana.com/)

## Manifests available

Looks inside [manifest folder](manifests/) to see available manifest

## Use It in minikube

Looks inside [HowTos folder](HowTos/) to see available docs per OS

## Generating Kubernetes manifests from templates

Clone the repository

```bash
git clone https://github.com/slashdevops/kube-visibility.git
cd kube-visibility/
```

> __NOTE:__  The bundle of manifest generated with kustomize has some dependencies with
> each other (prometheus depends on prometheus-operator and needs that it was created first), so when you
> execute the first time the manifest, some errors will occur.
> After the first execution you need to wait until some resources were created, and then you can execute
> again the command to create the resources into the k8s cluster.
> If you are using the kubernetes-dashboard you can watch when the first execution finished creating
> the resources, and then you can execute it again to finish with the instalation.

Generate a unique file bundle and then apply it

```bash
kustomize build manifests/minikube-k8s-1.16 > kube-visibility.yaml
kubectl apply -f kube-visibility.yaml
```

or all in one command:

```bash
kustomize build manifests/minikube-k8s-1.16 | kubectl apply -f -
```

## Access to graphical tools

All these tools are accessible (using the method described below) when you follow the instructions described in [HowTos folder](HowTos/) for minikube

### kubernetes Dashboard

```bash
kubectl proxy
```
NOTES:
* Link: [Kubernetes Dashboard](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy) --> http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy
* To Create a `ClusterRoleBinding` following the instructions inside [HowTos folder](HowTos/) before trying to get a token
* Access Token: `kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep default | awk '{print $1}')`

### Prometheus

```bash
kubectl --namespace kube-visibility port-forward svc/prometheus-visibility 9090
```
NOTES:
* link: [prometheus](http://localhost:9090) --> http://localhost:9090

### Alertmanager

```bash
kubectl --namespace kube-visibility port-forward svc/alertmanager-visibility 9093
```
NOTES:
* link: [alertmanager](http://localhost:9093) --> http://localhost:9093

### Grafana

```bash
kubectl --namespace kube-visibility port-forward svc/grafana 3000
```
NOTES:
* Link: [grafana](http://localhost:3000) --> http://localhost:3000
* user: admin
* password: admin

## Development / Contributing

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