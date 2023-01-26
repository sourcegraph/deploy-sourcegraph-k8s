# Overlays

An overlay is a collection of resources that is constructed from the base directory, with additional components located inside the "components" directory.

## How to use

See the [Sourcegraph Kustomize docs](https://docs.sourcegraph.com/admin/deploy/kubernetes/kustomize) for the latested instructions.

## Create an overlay

The overlays/template folder contains a file named `kustomization.template.yaml` that is preconfigured to construct an overlay for deploying Sourcegraph.

To create a Sourcegraph overlay

**Step 1**: Create a new directory within the `overlays` subdirectory.

- The name of this directory, $OVERLAY_NAME, serves as the name of your overlay, for example, dev, prod, staging, etc.

```bash
# from the root of this repository
mkdir overlays/$OVERLAY_NAME
```

**Step 2**: Copy the `kustomization.template.yaml` file from the `overlays/template` directory to the new directory created in step 1, and rename it to `kustomization.yaml`.

```bash
cp overlays/template/kustomization.template.yaml overlays/$OVERLAY_NAME/kustomization.yaml
```

**Step 3**: You can begin customizing your Sourcegraph deployment by updating the [kustomization.yaml file](https://docs.sourcegraph.com/admin/deploy/kubernetes/kustomize/intro#kustomization-yaml) inside your overlay, following our [configuration guides](https://docs.sourcegraph.com/admin/deploy/kubernetes/kustomize/configure.md) for guidance.
