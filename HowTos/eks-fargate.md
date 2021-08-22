# EKS Fargate - Limitations

[AWS Fargate](https://aws.amazon.com/fargate/) is a serverless compute engine for containers that works with both Amazon Elastic Container Service (ECS) and Amazon Elastic Kubernetes Service (EKS). Fargate removes the need to provision and manage servers, lets you specify and pay for resources per application, and improves security through application isolation by design.

- Limitations
  - There is a maximum of 4 vCPU and 30Gb memory per pod.
  - Currently there is no support for stateful workloads that require persistent volumes or file systems.
  - You cannot run `Daemonsets`, Privileged pods, or pods that use HostNetwork or HostPort.
  - The only load balancer you can use is an Application Load Balancer.

# Kube-Visibility 
### Node-Exporter - Daemonset

If you deploy kube-visibility on an EKS Kubernetes cluster with workloads on Fargate, by default the [`kube-scheduler`](https://kubernetes.io/docs/reference/command-line-tools-reference/kube-scheduler/) will attempt to deploy the [`node-exporter`](../pkg/upstream/node_exporter/daemonset.yaml) on the Fargate nodes. 

The `node-exporter` pod will hang in a pending state because of the Fargate [limitations](#eks-fargate---limitations).
 
### Deactivate node-exporter from being scheduled on Fargate nodes.

```yaml
affinity:
nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
    nodeSelectorTerms:
    - matchExpressions:
        - key: eks.amazonaws.com/compute-type
        operator: NotIn
        values:
        - fargate  
```

Full deployment patch manifest that can be applied on [node-exporter](../pkg/instance/node_exporter/daemonset-patch.yaml)

```yaml
---
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: node-exporter
spec:
  template:
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: eks.amazonaws.com/compute-type
                operator: NotIn
                values:
                - fargate  
```