# K3s Overlay

An overlay to start a pre-configured Sourcegraph instance for deploying to a k3s cluster.

## How to use

### Local build

If you have this repository cloned locally, check out a version branch that support this overlay, and then run the command below at the root of this repository to generate the manifests for with this overlay:

```sh
# Replace xs with your instance size
kubectl kustomize /examples/k3s/xs -o cluster.yaml
```

The manifests will be grouped and exported to the cluster.yaml directory.

### Remote build

You can generate the manifests without cloning the repository using the kustomize remote build feature. To do that, run the command below in your terminal:

```sh
# Replace xs with your instance size
# Replace v5.0.0 to a version branch (must be 4.5.0 or above) that support this overlay
kubectl kustomize https://github.com/sourcegraph/deploy-sourcegraph-k8s/examples/k3s/xs?ref=v5.0.0 -o cluster.yaml
```

The manifests will be grouped and exported to the cluster.yaml file in the directory where you run the command from.
