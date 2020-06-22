# base

This folder contain the manifest files from the original project

## Check installations

### node_exporter

```bash
kubectl --namespace kube-visibility port-forward svc/node-exporter 9100
```

[http://localhost:9100/metrics](http://localhost:9100/metrics)

### kube-state-metrics

```bash
kpt pkg get https://github.com/kubernetes/kube-state-metrics.git/examples/standard@v1.9.6 kube-state-metrics
```

```bash
kubectl --namespace kube-visibility port-forward svc/kube-state-metrics 8080
kubectl --namespace kube-visibility port-forward svc/kube-state-metrics 8081
```

[http://localhost:9100/metrics](http://localhost:8080/metrics)
[http://localhost:9100/metrics](http://localhost:8081/metrics)

### prometheus-adapter

```bash
kubectl --namespace kube-visibility port-forward svc/prometheus-adapter 443
```

[http://localhost:443/metrics](http://localhost:6443/metrics)

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