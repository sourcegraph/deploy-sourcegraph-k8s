# Instances

See the [Sourcegraph Kustomize docs](https://docs.sourcegraph.com/admin/deploy/kubernetes/kustomize) for the latested instructions.

## Create an overlay for your instances

The [instances/template](template) folder contains a file named [kustomization.template.yaml](template/kustomization.template.yaml)) that is preconfigured to construct a Kustomize overlay for deploying Sourcegraph.

**Step 1**: Create a new directory within the `instances` subdirectory.

- The name of this directory, $INSTANCE_NAME, serves as the name of your overlay, for example, dev, prod, staging, etc.

```bash
# from the root of this repository
mkdir instances/$INSTANCE_NAME
```

**Step 2**: Copy the `kustomization.template.yaml` file from the `instances/template` directory to the new directory created in step 1, and rename it to `kustomization.yaml`.

```bash
cp instances/template/kustomization.template.yaml instances/$INSTANCE_NAME/kustomization.yaml
```

**Step 3**: You can begin customizing your Sourcegraph deployment by updating the [kustomization.yaml file](https://docs.sourcegraph.com/admin/deploy/kubernetes/kustomize/intro#kustomization-yaml) inside $INSTANCE_NAME (the directory for your instance). Please follow our [configuration guides](https://docs.sourcegraph.com/admin/deploy/kubernetes/kustomize/configure.md) for guidance.
