# kube-state-metrics

NOTES: 

v1.9.6 > k8s 1.16.x 
* https://github.com/kubernetes/kube-state-metrics/issues/1093
* https://github.com/sighupio/fury-kubernetes-monitoring/issues/32

Important URLs: 

* https://github.com/kubernetes/kube-state-metrics
* https://github.com/brancz/kube-rbac-proxy
* https://github.com/kubernetes-sigs/kustomize
* https://googlecontainertools.github.io/kpt/

This project was imported and maintaint using KPT and Kustomize

## Imported

```bash
cd base/
kpt pkg get https://github.com/kubernetes/kube-state-metrics.git/examples/standard@v1.9.7 kube-state-metrics
```

## Maintanined

**NOTE:** Replace x.y.z with the right version

```bash
cd base/kube-state-metrics
kpt pkg update https://github.com/kubernetes/kube-state-metrics.git/examples/standard@vx.y.x --strategy=resource-merge
```

## Kustomize

The files

* kustomization.yaml
* role-binding.yaml
* role.yaml

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
kubectl --namespace kube-visibility port-forward svc/kube-state-metrics 8080
kubectl --namespace kube-visibility port-forward svc/kube-state-metrics 8081
```

[http://localhost:9100/metrics](http://localhost:8080/metrics)
[http://localhost:9100/metrics](http://localhost:8081/metrics)

