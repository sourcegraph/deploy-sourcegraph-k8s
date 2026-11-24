# Executors (Native Kubernetes)

> ⚠️ **Beta:** Native Kubernetes executors are in beta. For production workloads, consider deploying using
> [Terraform](https://docs.sourcegraph.com/self-hosted/executors/deploy-executors-terraform) or the
> [Linux binary](https://docs.sourcegraph.com/self-hosted/executors/deploy-executors-binary) for better long-term support.

Executors are Sourcegraph’s solution for running untrusted code in a secure and controllable way. For more information on native kubernetes executors and how they are used see the [Executors documentation](https://docs.sourcegraph.com/admin/executors/deploy_executors_kubernetes)

## Deploying

This directory contains components for the optional deployment of Sourcegraph Executors on Kubernetes.

It is expected that all components contained in this directory and any subdirectories are deployed to ensure full functionality and best performance.

The following components will deploy:

- [Executor ConfigMap](./executor.ConfigMap.yaml) the configurations for the executors.
- [Executor Deployment](./executor.Deployment.yaml) The executor, which runs each batch change and auto-indexing job in its own Kubernetes Job pod. Each job pod has its own workspace volume and can run on any node. To run more jobs at once, raise `EXECUTOR_MAXIMUM_NUM_JOBS` or scale the Deployment's replicas.
- [Executor Service](./executor.Service.yaml) A headless service for executor metrics access. Executors are not externally accessible.
- [RBAC] The required rules for executors to interact with the Kubernetes API.
  - [Executor Role](./rbac/executor.Role.yaml) Contains the required rules.
  - [Executor Role Binding](./rbac/executor.RoleBinding.yaml) Binds the rules to the executor service account.
  - [Executor Service Account](./rbac/executor.ServiceAccount.yaml) The service account used by executors.
