# kube-visibility kpt package

## kpt

### get

```bash
kpt pkg get https://github.com/slashdevops/kube-visibility/pkg@ft-kpt kube-visibility
```

### setters

List setters

```bash
kpt cfg list-setters .
```

Package setters

```bash
kpt cfg set . namespace monitoring
```

Prometheus setters

```bash
kpt cfg set . prometheus.replicas 1
kpt cfg set . prometheus.enable-admin-api false
```