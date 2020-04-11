# kube-visibility

This project was inspired by [kube-prometheus](https://github.com/coreos/kube-prometheus) which is great but:
* It is a little complicated to configure in a custom way because It is also using [jsonnet](https://jsonnet.org/) as a data templating language, which is very hard to understand and apply
* You don't know exactly the version available ( they don't manage releases) and this complicates the  compatibility with your kubernetes version

The idea of this project is to use [kustomize](https://github.com/kubernetes-sigs/kustomize) tool which is incredibly amazing and easy to use to create manifest overlays.

## Projects used in this repository

* [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics)
* [node_exporter](https://github.com/prometheus/node_exporter)
* [prometheus-operator](https://github.com/coreos/prometheus-operator)
* [prometheus](https://prometheus.io/docs/introduction/overview/)
* [alertmanager](https://prometheus.io/docs/alerting/alertmanager/)
* [grafana](https://grafana.com/)

## Manifests availables

Looks inside [manifest folder](manifests/) to see available manifest

## Use It in minikube

Looks inside [HowTos folder](HowTos/) to see available docs per OS

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
kustomize build manifests/minikube-k8s-1.15 | kubectl apply -f -
```

## Access to graphical tools

### kubernetes Dashboard

```bash
kubectl proxy
```
**NOTE:** First you need to get the token (Secret) of the `default ServiceAccount of kube-system namespace`

```bash
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep default | awk '{print $1}')
```

**link:** [Kubernetes Dashboard](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy)

### Prometheus

```bash
kubectl --namespace kube-visibility port-forward svc/prometheus-visibility 9090
```
**link:** [prometheus](http://localhost:9090)

### Alertmanager

```bash
kubectl --namespace kube-visibility port-forward svc/alertmanager-visibility 9093
```
**link:** [prometheus](http://localhost:9093)

### Grafana

```bash
kubectl --namespace kube-visibility port-forward svc/grafana 3000
```
**link:** [prometheus](http://localhost:3000)

## Development / Contributing

WIP

## License

This module is released under the GNU General Public License Version 3:

* [http://www.gnu.org/licenses/gpl-3.0-standalone.html](http://www.gnu.org/licenses/gpl-3.0-standalone.html)

## Author Information

* [Christian González Di Antonio](https://github.com/christiangda)