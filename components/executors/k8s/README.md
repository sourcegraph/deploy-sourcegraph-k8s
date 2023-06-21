# Executors (Native Kubernetes)

Executors are Sourcegraph’s solution for running untrusted code in a secure and controllable way. For more information on dind executors and how they are used see the Executors [dind documentation](https://docs.sourcegraph.com/admin/executors/deploy_executors_dind)

## Deploying

This directory contains components for the optional deployment of Sourcegraph Executors (dind) on Kubernetes.

It is expected that all components contained in this directory and any subdirectories are deployed to ensure full functionality and best performance.

The following components will deploy:

- [Executor ConfigMap](./executor.ConfigMap.yaml) configuration for the docker sidecar to use the pull-through cache.
- [Executor Deployment](./executor.Deployment.yaml) An Executor replica with a Docker sidecar to run isolated batch changes and auto-indexing jobs. This deployment requires a [privileged security context](https://kubernetes.io/docs/concepts/security/pod-security-standards/).
- [Executor Persistent Volume Claim](./executor.PersistentVolumeClaim.yaml) A headless service for executor metrics access. Executors are not externally accessible.
- [Executor Service](./executor.Service.yaml) A headless service for executor metrics access. Executors are not externally accessible.
- [RBAC] 
  - [Executor Role](./rbac/executor.Role.yaml) 
  - [Executor Role Binding](./rbac/executor.RoleBinding.yaml)
  - [Executor Service Account](./rbac/executor.ServiceAccount.yaml)
