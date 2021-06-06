# Package Content Information

The content of this files is auto-generated using the bash script [fill_pkg_info.sh](../tools/fill_pkg_info.sh)

## kpt cfg count 

```text
pkg/
: 4
APIService: 1
Alertmanager: 2
ClusterRole: 7
ClusterRoleBinding: 6
CustomResourceDefinition: 8
DaemonSet: 2
Deployment: 8
Kustomization: 24
Namespace: 2
PodMonitor: 1
Prometheus: 2
PrometheusRule: 10
Role: 2
RoleBinding: 3
RoleBindingList: 2
RoleList: 2
Service: 7
ServiceAccount: 7
ServiceMonitor: 10
```

## kpt cfg list-setters 

```text
pkg/
                      NAME                                VALUE                SET BY        DESCRIPTION   COUNT   REQUIRED   IS SET  
  alertmanager.external-url                       http://localhost:9093/   package-default                 1       No         No      
  alertmanager.log-format                         logfmt                   package-default                 1       No         No      
  alertmanager.log-level                          info                     package-default                 1       No         No      
  alertmanager.replicas                           1                        package-default                 1       No         No      
  alertmanager.resources-limits-cpu               100m                     package-default                 1       No         No      
  alertmanager.resources-limits-memory            100Mi                    package-default                 1       No         No      
  alertmanager.resources-requests-cpu             50m                      package-default                 1       No         No      
  alertmanager.resources-requests-memory          50Mi                     package-default                 1       No         No      
  alertmanager.retention                          120h                     package-default                 1       No         No      
  grafana.replicas                                1                        package-default                 1       No         No      
  grafana.resources-limits-cpu                    100m                     package-default                 1       No         No      
  grafana.resources-limits-memory                 100Mi                    package-default                 1       No         No      
  grafana.resources-requests-cpu                  50m                      package-default                 1       No         No      
  grafana.resources-requests-memory               50Mi                     package-default                 1       No         No      
  kube-state-metrics.replicas                     1                        package-default                 1       No         No      
  kube-state-metrics.resources-limits-cpu         100m                     package-default                 1       No         No      
  kube-state-metrics.resources-limits-memory      100Mi                    package-default                 1       No         No      
  kube-state-metrics.resources-requests-cpu       50m                      package-default                 1       No         No      
  kube-state-metrics.resources-requests-memory    50Mi                     package-default                 1       No         No      
  namespace                                       kube-visibility          package-default                 22      No         No      
  node-exporter.resources-limits-cpu              250m                     package-default                 1       No         No      
  node-exporter.resources-limits-memory           180Mi                    package-default                 1       No         No      
  node-exporter.resources-requests-cpu            100m                     package-default                 1       No         No      
  node-exporter.resources-requests-memory         180Mi                    package-default                 1       No         No      
  prometheus-adapter.replicas                     1                        package-default                 1       No         No      
  prometheus-adapter.resources-limits-cpu         100m                     package-default                 1       No         No      
  prometheus-adapter.resources-limits-memory      100Mi                    package-default                 1       No         No      
  prometheus-adapter.resources-requests-cpu       50m                      package-default                 1       No         No      
  prometheus-adapter.resources-requests-memory    50Mi                     package-default                 1       No         No      
  prometheus-operator.resources-limits-cpu        200m                     package-default                 1       No         No      
  prometheus-operator.resources-limits-memory     200Mi                    package-default                 1       No         No      
  prometheus-operator.resources-requests-cpu      100m                     package-default                 1       No         No      
  prometheus-operator.resources-requests-memory   100Mi                    package-default                 1       No         No      
  prometheus.enable-admin-api                     true                     package-default                 1       No         No      
  prometheus.external-url                         http://localhost:9090/   package-default                 1       No         No      
  prometheus.log-format                           logfmt                   package-default                 1       No         No      
  prometheus.log-level                            info                     package-default                 1       No         No      
  prometheus.replicas                             1                        package-default                 1       No         No      
  prometheus.resources-limits-cpu                 200m                     package-default                 1       No         No      
  prometheus.resources-limits-memory              500Mi                    package-default                 1       No         No      
  prometheus.resources-requests-cpu               100m                     package-default                 1       No         No      
  prometheus.resources-requests-memory            300Mi                    package-default                 1       No         No      
  prometheus.retention                            3w                       package-default                 1       No         No      
  prometheus.retention-size                       10GB                     package-default                 1       No         No      
```

## kpt cfg tree 

```bash
pkg
├── instance
│   ├── [kustomization.yaml]  Kustomization 
│   ├── [namespace.yaml]  Namespace kube-visibility
│   ├── alertmanager
│   │   ├── [alertmanager-patch.yaml]  Alertmanager visibility
│   │   ├── [kustomization.yaml]  Kustomization 
│   │   └── [service-monitor.yaml]  ServiceMonitor alertmanager-visibility
│   ├── grafana
│   │   ├── [deployment-patch.yaml]  Deployment grafana
│   │   ├── [kustomization.yaml]  Kustomization 
│   │   └── [service-monitor.yaml]  ServiceMonitor grafana
│   ├── k8s-pod-monitors
│   │   ├── [kube-dns.yaml]  PodMonitor kube-dns
│   │   └── [kustomization.yaml]  Kustomization 
│   ├── k8s-service-monitors
│   │   ├── [controller-manager.yaml]  ServiceMonitor kube-controller-manager
│   │   ├── [kube-apiserver.yaml]  ServiceMonitor kube-apiserver
│   │   ├── [kube-scheduler.yaml]  ServiceMonitor kube-scheduler
│   │   ├── [kubelet.yaml]  ServiceMonitor kubelet
│   │   └── [kustomization.yaml]  Kustomization 
│   ├── kube-state-metrics
│   │   ├── [deployment-patch.yaml]  Deployment kube-state-metrics
│   │   ├── [kustomization.yaml]  Kustomization 
│   │   └── [service-monitor.yaml]  ServiceMonitor kube-state-metrics
│   ├── node_exporter
│   │   ├── [daemonset-patch.yaml]  DaemonSet node-exporter
│   │   ├── [kustomization.yaml]  Kustomization 
│   │   └── [service-monitor.yaml]  ServiceMonitor node-exporter
│   ├── prometheus
│   │   ├── [kustomization.yaml]  Kustomization 
│   │   └── roles-different-namespace
│   │       ├── [kustomization.yaml]  Kustomization 
│   │       └── [role-binding-auth-reader.yaml]  RoleBinding kube-system/resource-metrics-auth-reader
│   ├── prometheus-adapter
│   │   └── [kustomization.yaml]  Kustomization 
│   ├── override-namespace
│   │   ├── [apiserver.yaml]  APIService v1beta1.metrics.k8s.io
│   │   ├── [deployment-patch.yaml]  Deployment prometheus-adapter
│   │   └── [kustomization.yaml]  Kustomization 
│   ├── prometheus-operator
│   │   ├── [deployment-patch.yaml]  Deployment prometheus-operator
│   │   ├── [kustomization.yaml]  Kustomization 
│   │   └── [service-monitor.yaml]  ServiceMonitor prometheus-operator
│   ├── override-namespace
│   │   ├── [kustomization.yaml]  Kustomization 
│   │   ├── [prometheus-patch.yaml]  Prometheus visibility
│   │   ├── [service-monitor.yaml]  ServiceMonitor prometheus-visibility
│   │   ├── alert-rules
│   │   │   ├── [alertmanager.yaml]  PrometheusRule alertmanager-alert-rules
│   │   │   ├── [general.yaml]  PrometheusRule general-alert-rules
│   │   │   ├── [kube-state-metrics.yaml]  PrometheusRule kube-state-metrics-alert-rules
│   │   │   ├── [kubernetes.yaml]  PrometheusRule kubernetes-alert-rules
│   │   │   ├── [kustomization.yaml]  Kustomization 
│   │   │   ├── [node-exporter.yaml]  PrometheusRule node-exporter-alert-rules
│   │   │   ├── [prometheus-operator.yaml]  PrometheusRule prometheus-operator-alert-rules
│   │   │   └── [prometheus.yaml]  PrometheusRule prometheus-alert-rules
│   │   └── record-rules
│   │       ├── [general.yaml]  PrometheusRule general-record-rules
│   │       ├── [kubernetes.yaml]  PrometheusRule kubernetes-record-rules
│   │       ├── [kustomization.yaml]  Kustomization 
│   │       └── [node-exporter.yaml]  PrometheusRule node-exporter-record-rules
│   └── roles-different-namespace
│       ├── [kube-visibility-role-binding.yaml]  RoleBindingList 
│       ├── [kube-visibility-roles.yaml]  RoleList 
│       └── [kustomization.yaml]  Kustomization 
└── upstream
    ├── [kustomization.yaml]  Kustomization 
    ├── [namespace.yaml]  Namespace kube-visibility
    ├── alertmanager
    │   ├── [alertmanager.yaml]  Alertmanager visibility
    │   ├── [kustomization.yaml]  Kustomization 
    │   ├── [service-account.yaml]  ServiceAccount alertmanager-visibility
    │   └── [service.yaml]  Service alertmanager-visibility
    ├── grafana
    │   ├── [deployment.yaml]  Deployment grafana
    │   ├── [kustomization.yaml]  Kustomization 
    │   ├── [service-account.yaml]  ServiceAccount grafana
    │   └── [service.yaml]  Service grafana
    ├── kube-state-metrics
    │   ├── [cluster-role-binding.yaml]  ClusterRoleBinding kube-state-metrics
    │   ├── [cluster-role.yaml]  ClusterRole kube-state-metrics
    │   ├── [deployment.yaml]  Deployment kube-state-metrics
    │   ├── [kustomization.yaml]  Kustomization 
    │   ├── [role-binding.yaml]  RoleBinding kube-state-metrics
    │   ├── [role.yaml]  Role kube-state-metrics
    │   ├── [service-account.yaml]  ServiceAccount kube-state-metrics
    │   └── [service.yaml]  Service kube-state-metrics
    ├── node_exporter
    │   ├── [cluster-role-binding.yaml]  ClusterRoleBinding node-exporter
    │   ├── [cluster-role.yaml]  ClusterRole node-exporter
    │   ├── [daemonset.yaml]  DaemonSet node-exporter
    │   ├── [kustomization.yaml]  Kustomization 
    │   ├── [service-account.yaml]  ServiceAccount node-exporter
    │   └── [service.yaml]  Service node-exporter
    ├── prometheus
    │   ├── [kustomization.yaml]  Kustomization 
    │   ├── [prometheus.yaml]  Prometheus visibility
    │   ├── [role-binding-config.yaml]  RoleBinding prometheus-visibility-config
    │   ├── [role-binding-namespaces.yaml]  RoleBindingList 
    │   ├── [role-config.yaml]  Role prometheus-visibility-config
    │   ├── [role-namespaces.yaml]  RoleList 
    │   ├── [service-account.yaml]  ClusterRole prometheus-visibility
    │   ├── [service-account.yaml]  ClusterRoleBinding prometheus-visibility
    │   ├── [service-account.yaml]  ServiceAccount prometheus-visibility
    │   ├── [service.yaml]  Service prometheus-visibility
    │   └── prometheus-adapter
    │       ├── [cluster-role-aggregated-metrics-reader.yaml]  ClusterRole system:aggregated-metrics-reader
    │       ├── [cluster-role-binding-delegator.yaml]  ClusterRoleBinding resource-metrics:system:auth-delegator
    │       ├── [cluster-role-binding.yaml]  ClusterRoleBinding prometheus-adapter
    │       ├── [cluster-role-server-resources.yaml]  ClusterRole resource-metrics-server-resources
    │       ├── [cluster-role.yaml]  ClusterRole prometheus-adapter
    │       ├── [deployment.yaml]  Deployment prometheus-adapter
    │       ├── [kustomization.yaml]  Kustomization 
    │       ├── [service-account.yaml]  ServiceAccount prometheus-adapter
    │       └── [service.yaml]  Service kube-visibility/prometheus-adapter
    └── prometheus-operator
        ├── [bundle.yaml]  CustomResourceDefinition alertmanagerconfigs.monitoring.coreos.com
        ├── [bundle.yaml]  CustomResourceDefinition alertmanagers.monitoring.coreos.com
        ├── [bundle.yaml]  CustomResourceDefinition podmonitors.monitoring.coreos.com
        ├── [bundle.yaml]  CustomResourceDefinition probes.monitoring.coreos.com
        ├── [bundle.yaml]  ClusterRole prometheus-operator
        ├── [bundle.yaml]  ClusterRoleBinding prometheus-operator
        ├── [bundle.yaml]  CustomResourceDefinition prometheuses.monitoring.coreos.com
        ├── [bundle.yaml]  CustomResourceDefinition prometheusrules.monitoring.coreos.com
        ├── [bundle.yaml]  CustomResourceDefinition servicemonitors.monitoring.coreos.com
        ├── [bundle.yaml]  CustomResourceDefinition thanosrulers.monitoring.coreos.com
        ├── [bundle.yaml]  Deployment default/prometheus-operator
        ├── [bundle.yaml]  Service default/prometheus-operator
        ├── [bundle.yaml]  ServiceAccount default/prometheus-operator
        └── [kustomization.yaml]  Kustomization 
```
