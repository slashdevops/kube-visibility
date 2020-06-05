# prometheus-adapter

Important URLs:

* https://github.com/DirectXMan12/k8s-prometheus-adapter

## Import

manually from: https://github.com/DirectXMan12/k8s-prometheus-adapter/tree/master/deploy/manifests
and then adapted to the project

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
kubectl --namespace kube-visibility port-forward svc/prometheus-adapter 443
```

[http://localhost:443/metrics](http://localhost:6443/metrics)