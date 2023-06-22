# Executors (Native Kubernetes)

Executors are Sourcegraph’s solution for running untrusted code in a secure and controllable way. For more information on native kubernetes executors and how they are used see the [Executors documentation](https://docs.sourcegraph.com/admin/executors/deploy_executors_kubernetes)

## Deploying

This directory contains components for the optional deployment of Sourcegraph Executors on Kubernetes.

It is expected that all components contained in this directory and any subdirectories are deployed to ensure full functionality and best performance.

The following components will deploy:

- [Executor ConfigMap](../patches/executor.ConfigMap.yaml) the configurations for the executors.
- [Executor Deployment](./executor.Deployment.yaml) An Executor replica with a Docker sidecar to run isolated batch changes and auto-indexing jobs.
- [Executor Persistent Volume Claim](./executor.PersistentVolumeClaim.yaml) A headless service for executor metrics access. Executors are not externally accessible.
- [Executor Service](./executor.Service.yaml) A headless service for executor metrics access. Executors are not externally accessible.
- [RBAC] The required rules for executors to interact with the Kubernetes API.
  - [Executor Role](./rbac/executor.Role.yaml) Contains the required rules.
  - [Executor Role Binding](./rbac/executor.RoleBinding.yaml) Binds the rules to the executor service account.
  - [Executor Service Account](./rbac/executor.ServiceAccount.yaml) The service account used by executors.
