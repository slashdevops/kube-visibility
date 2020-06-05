# prometheus

Important URLs: 

* https://github.com/prometheus/prometheus
* https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md

## Kustomize

The files

* kustomization.yaml

was created by kube-visibility project

## Check

Validate manifest

```bash
kustomize build . | kubeval --ignore-missing-schemas -
```

Create resource in the cluster

```bash
cat <<EOF | kubectl apply -f -
---
apiVersion: v1
kind: Namespace
metadata:
  name: kube-visibility
EOF
```

```bash
kustomize build . | kubectl apply -f -
```

or 

```bash
kubectl apply -k .
```

After manifest creation

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