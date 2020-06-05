# grafana

Important URLs:

* https://grafana.com/grafana/

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

### Grafana

```bash
kubectl --namespace kube-visibility port-forward svc/grafana 3000
```

NOTES:

* Link: [grafana](http://localhost:3000) --> http://localhost:3000
* user: admin
* password: admin