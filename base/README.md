# Sourcegraph Kubernetes Base Cluster

The `sourcegraph` directory contains manifests for all services for the Sourcegraph main stack.

The `monitoring` directory contains manifests for all Sourcegraph monitoring services.

## RBAC

In our base cluster, all services run with non-root and non-privileged. Role-Based Access Control (RBAC) resources are also not enabled by default, which results in manual mapping of service addresses through environment variables being the only way to discover services. However, these service addresses have been preconfigured in the base cluster.

To enable automatic service discovery and clean up of temporary cache data, RBAC resources must be created using the `privileged` component or the `enable/service-discovery` component.

### cAdvisor

For the cadvisor to function properly in your deployment, a Kubernetes cluster with role-based access control (RBAC) enabled is required.

If using cluster roles and cluster rolebinding RBAC is not feasible, you may choose to deploy Sourcegraph without cadvisor as it will not work in your cluster without RBAC enabled.

## Deploy Sourcegraph

See the [Sourcegraph Kustomize docs](https://docs.sourcegraph.com/admin/deploy/kubernetes/kustomize) for the latested instructions.
Hello World
