# kube-state-metrics

NOTES:

v2.0.0 > k8s 1.17.x

Important URLs:

* https://github.com/kubernetes/kube-state-metrics
* https://github.com/kubernetes/kube-state-metrics/tree/master/docs
* https://github.com/brancz/kube-rbac-proxy
* https://github.com/kubernetes-sigs/kustomize
* https://googlecontainertools.github.io/kpt/

## Upgrade

Download manifest

```bash
mkdir -p kube-state-metrics/
cd kube-state-metrics

curl --remote-name --remote-header-name  https://raw.githubusercontent.com/kubernetes/kube-state-metrics/master/examples/standard/cluster-role-binding.yaml

curl --remote-name --remote-header-name  https://raw.githubusercontent.com/kubernetes/kube-state-metrics/master/examples/standard/cluster-role.yaml

curl --remote-name --remote-header-name  https://raw.githubusercontent.com/kubernetes/kube-state-metrics/master/examples/standard/deployment.yaml

curl --remote-name --remote-header-name  https://raw.githubusercontent.com/kubernetes/kube-state-metrics/master/examples/standard/service-account.yaml

curl --remote-name --remote-header-name  https://raw.githubusercontent.com/kubernetes/kube-state-metrics/master/examples/standard/service.yaml

```

create customization file

```bash
kustomize create --autodetect --recursive --namespace kube-visibility
```

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

