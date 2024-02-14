# Executors (Docker-in-Docker)

Executors are Sourcegraph’s solution for running untrusted code in a secure and controllable way. For more information on dind executors and how they are used see the Executors [dind documentation](https://docs.sourcegraph.com/admin/executors/deploy_executors_dind)

## Deploying

This directory contains components for the optional deployment of Sourcegraph Executors (dind) on Kubernetes.

It is expected that all components contained in this directory and any subdirectories are deployed to ensure full functionality and best performance.

The following components will deploy:

- [Executor ConfigMap](./executor.ConfigMap.yaml) the configurations for the executors.
- [Executor Deployment](./executor.Deployment.yaml) An Executor replica with a Docker sidecar to run isolated batch changes and auto-indexing jobs. This deployment requires a [privileged security context](https://kubernetes.io/docs/concepts/security/pod-security-standards/).
- [Executor Service](./executor.Service.yaml) A headless service for executor metrics access. Executors are not externally accessible.

Optionally, a Private Docker Registry can be deployed to avoid Docker Hub rate limits.

- [Private docker registry]
  - [Registry Deployment](./private-docker-registry/private-docker-registry.Deployment.yaml) A private docker registry configured as a pull-through cache to avoid docker hub rate limiting.
  - [Registry Service](./private-docker-registry/private-docker-registry.Service.yaml) A service to access the private-docker-registry.
  - [Registry Persistent Volume](./private-docker-registry/private-docker-registry.PersistentVolumeClaim.yaml) A volume to store images in the private-docker-registry.
Hello World
