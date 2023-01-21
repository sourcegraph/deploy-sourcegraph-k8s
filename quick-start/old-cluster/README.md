# Old Base Overlay

An overlay to generate resources similar to the old cluster.

IMPORTANT: RBAC must be enabled for your cluster.

## How to use

Run the following command (pick a command for your instance size) from the root of this repository:

```sh
# To generate manifests using the defaults values from the old base cluster:
kubectl kustomize /quick-start/old-cluster -o /cluster.yaml

# To generate manifests for the old base cluster:
kubectl kustomize /quick-start/old-cluster -o /cluster.yaml
```
