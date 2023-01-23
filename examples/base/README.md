# Base overlay

The base overlays are for deploying all Sourcegraph services from the base directory, except cAdvisor.

```bash
# NOTE: replace `xs` with your instance size.
kubectl kustomize /examples/base/xs -o cluster.yaml
```
