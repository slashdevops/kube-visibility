# Package Content Information

The content of this files is auto-generated using the bash script [fill_pkg_info.sh](../tools/fill_pkg_info.sh)

## tree 

```text
pkg
├── Kptfile
├── README.md
├── instance
│   ├── alertmanager
│   │   ├── alertmanager-patch.yaml
│   │   ├── configuration
│   │   │   └── alertmanager.yaml
│   │   ├── kustomization.yaml
│   │   └── service-monitor.yaml
│   ├── grafana
│   │   ├── configuration
│   │   │   └── grafana.ini
│   │   ├── dashboards
│   │   │   ├── README.md
│   │   │   ├── grafana
│   │   │   │   ├── grafana-internals.json
│   │   │   │   └── main-dashboard.json
│   │   │   ├── infrastructure
│   │   │   │   ├── infrastructure-nodes-details.json
│   │   │   │   ├── nodes.json
│   │   │   │   ├── use-method-cluster.json
│   │   │   │   └── use-method-node.json
│   │   │   ├── kubernetes
│   │   │   │   ├── kubernetes-api-server.json
│   │   │   │   ├── kubernetes-applications-version.json
│   │   │   │   ├── kubernetes-compute-resources-cluster.json
│   │   │   │   ├── kubernetes-compute-resources-namespace-workloads.json
│   │   │   │   ├── kubernetes-compute-resources-namespace.json
│   │   │   │   ├── kubernetes-compute-resources-node-pods.json
│   │   │   │   ├── kubernetes-compute-resources-pod.json
│   │   │   │   ├── kubernetes-coredns.json
│   │   │   │   ├── kubernetes-horizontal-pod-autoscaler.json
│   │   │   │   ├── kubernetes-kubelet.json
│   │   │   │   ├── kubernetes-network-cluster.json
│   │   │   │   ├── kubernetes-network-namespace-pods.json
│   │   │   │   ├── kubernetes-network-namespace-workload.json
│   │   │   │   ├── kubernetes-network-pods.json
│   │   │   │   ├── kubernetes-network-workload.json
│   │   │   │   ├── kubernetes-objects-quantities.json
│   │   │   │   ├── kubernetes-persistent-volumes.json
│   │   │   │   └── kubernetes-statefulsets.json
│   │   │   ├── prometheus
│   │   │   │   ├── prometheus-remote-write.json
│   │   │   │   └── prometheus-stats.json
│   │   │   └── providers.yaml
│   │   ├── datasources
│   │   │   ├── README.md
│   │   │   └── datasources.yaml
│   │   ├── deployment-patch.yaml
│   │   ├── kustomization.yaml
│   │   └── service-monitor.yaml
│   ├── k8s-pod-monitors
│   │   ├── kube-dns.yaml
│   │   └── kustomization.yaml
│   ├── k8s-service-monitors
│   │   ├── controller-manager.yaml
│   │   ├── kube-apiserver.yaml
│   │   ├── kube-scheduler.yaml
│   │   ├── kubelet.yaml
│   │   └── kustomization.yaml
│   ├── kube-state-metrics
│   │   ├── deployment-patch.yaml
│   │   ├── kustomization.yaml
│   │   └── service-monitor.yaml
│   ├── kustomization.yaml
│   ├── namespace.yaml
│   ├── node_exporter
│   │   ├── daemonset-patch.yaml
│   │   ├── kustomization.yaml
│   │   └── service-monitor.yaml
│   ├── prometheus
│   │   ├── kustomization.yaml
│   │   ├── override-namespace
│   │   │   ├── alert-rules
│   │   │   │   ├── alertmanager.yaml
│   │   │   │   ├── general.yaml
│   │   │   │   ├── kube-state-metrics.yaml
│   │   │   │   ├── kubernetes.yaml
│   │   │   │   ├── kustomization.yaml
│   │   │   │   ├── node-exporter.yaml
│   │   │   │   ├── prometheus-operator.yaml
│   │   │   │   └── prometheus.yaml
│   │   │   ├── kustomization.yaml
│   │   │   ├── prometheus-patch.yaml
│   │   │   ├── record-rules
│   │   │   │   ├── general.yaml
│   │   │   │   ├── kubernetes.yaml
│   │   │   │   ├── kustomization.yaml
│   │   │   │   └── node-exporter.yaml
│   │   │   └── service-monitor.yaml
│   │   └── roles-different-namespace
│   │       ├── kube-visibility-role-binding.yaml
│   │       ├── kube-visibility-roles.yaml
│   │       └── kustomization.yaml
│   ├── prometheus-adapter
│   │   ├── kustomization.yaml
│   │   ├── override-namespace
│   │   │   ├── apiserver.yaml
│   │   │   ├── deployment-patch.yaml
│   │   │   └── kustomization.yaml
│   │   └── roles-different-namespace
│   │       ├── kustomization.yaml
│   │       └── role-binding-auth-reader.yaml
│   └── prometheus-operator
│       ├── deployment-patch.yaml
│       ├── kustomization.yaml
│       └── service-monitor.yaml
└── upstream
    ├── README.md
    ├── alertmanager
    │   ├── alertmanager.yaml
    │   ├── kustomization.yaml
    │   ├── service-account.yaml
    │   └── service.yaml
    ├── grafana
    │   ├── README.md
    │   ├── deployment.yaml
    │   ├── kustomization.yaml
    │   ├── service-account.yaml
    │   └── service.yaml
    ├── kube-state-metrics
    │   ├── README.md
    │   ├── cluster-role-binding.yaml
    │   ├── cluster-role.yaml
    │   ├── deployment.yaml
    │   ├── kustomization.yaml
    │   ├── role-binding.yaml
    │   ├── role.yaml
    │   ├── service-account.yaml
    │   └── service.yaml
    ├── kustomization.yaml
    ├── namespace.yaml
    ├── node_exporter
    │   ├── cluster-role-binding.yaml
    │   ├── cluster-role.yaml
    │   ├── daemonset.yaml
    │   ├── kustomization.yaml
    │   ├── service-account.yaml
    │   └── service.yaml
    ├── prometheus
    │   ├── README.md
    │   ├── kustomization.yaml
    │   ├── prometheus.yaml
    │   ├── role-binding-config.yaml
    │   ├── role-binding-namespaces.yaml
    │   ├── role-config.yaml
    │   ├── role-namespaces.yaml
    │   ├── service-account.yaml
    │   └── service.yaml
    ├── prometheus-adapter
    │   ├── README.md
    │   ├── cluster-role-aggregated-metrics-reader.yaml
    │   ├── cluster-role-binding-delegator.yaml
    │   ├── cluster-role-binding.yaml
    │   ├── cluster-role-server-resources.yaml
    │   ├── cluster-role.yaml
    │   ├── configmap-content
    │   │   ├── README.md
    │   │   └── config.yaml
    │   ├── deployment.yaml
    │   ├── kustomization.yaml
    │   ├── service-account.yaml
    │   └── service.yaml
    └── prometheus-operator
        ├── README.md
        ├── bundle.yaml
        └── kustomization.yaml

33 directories, 134 files
```