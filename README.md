# kube-visibility

This project was inspired by [kube-prometheus](https://github.com/coreos/kube-prometheus) which is great but:
* It is a little complicated to configure in a custom way because It is also using [jsonnet](https://jsonnet.org/) as a data templating language, which is very hard to understand and apply
* You don't know exactly the version available ( they don't manage releases) and this complicates the  compatibility with your kubernetes version

The idea of this project is to use [kustomize](https://github.com/kubernetes-sigs/kustomize) tool which is incredibly amazing and easy to use to create manifest overlays.

## Projects used in this reppository

* [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics)
* [node_exporter](https://github.com/prometheus/node_exporter)
* [prometheus-operator](https://github.com/coreos/prometheus-operator)
* [prometheus](https://prometheus.io/docs/introduction/overview/)
* [alertmanager](https://prometheus.io/docs/alerting/alertmanager/)
* [grafana](https://grafana.com/)

## Manifests availables

Looks inside [manifest folder](manifests/README.md)

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

## Development / Contributing

WIP

## License

This module is released under the GNU General Public License Version 3:

* [http://www.gnu.org/licenses/gpl-3.0-standalone.html](http://www.gnu.org/licenses/gpl-3.0-standalone.html)

## Author Information

* [Christian González Di Antonio](https://github.com/christiangda)