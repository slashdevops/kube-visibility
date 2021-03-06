# prometheus-operator

Important URLs:

* https://github.com/coreos/prometheus-operator

## Import

v0.39.x

```bash
mkdir -p prometheus-operator/
cd prometheus-operator
curl --remote-name --remote-header-name  https://raw.githubusercontent.com/coreos/prometheus-operator/master/bundle.yaml
kustomize create --autodetect --recursive --namespace kube-visibility
```

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

```bash
kubectl --namespace kube-visibility port-forward svc/node-exporter 9100
```

[http://localhost:9100/metrics](http://localhost:9100/metrics)