# node_exporter

Important URLs: 

* https://github.com/prometheus/node_exporter
* https://github.com/brancz/kube-rbac-proxy
* https://github.com/kubernetes-sigs/kustomize

## Kustomize

The files

* kustomization.yaml

was created by kube-visibility project

## Check

Validate manifest

```bash
kustomize build . | kubeval -
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