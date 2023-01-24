# Examples: Deploying Sourcegraph with Kustomize

This directory provides overlays that are ready to use for installing a pre-configured Sourcegraph instance in different environments for demonstration purposes. By using these overlays, you can easily deploy a Sourcegraph instance to your cluster, without the need for manually configuring all the necessary resources.

## How to use

> IMPORTANT: Always refer to the [Sourcegraph Kustomize docs](https://docs.sourcegraph.com/admin/deploy/kubernetes/kustomize) for the latest instructions.

Before you begin, make sure you have kubectl and kustomize installed on your system.

Step 1: Build manifests
Step 2: Review manifests
Step 3: Apply manifests

> NOTE: All commands in this guide should be run from the root of this repository.

### Build

To build the manifests using an overlay without applying them to your cluster, run the following command:

```bash
kubectl kustomize /examples/$OVERLAY_NAME -o cluster.yaml
```

This command will create a file named cluster.yaml in the root directory, which contains all the resources defined in the overlay you specified.

### Review

Before applying the manifests, it is important to review them to ensure they meet your requirements and do not include any unwanted changes.

You can review the manifests by running the following command:

```bash
less cluster.yaml
```

### Deploy

Once you have reviewed the manifests, you can apply them to your cluster using the following command:

```bash
kubectl apply --prune -l deploy=sourcegraph -f cluster.yaml
```

This command will apply all the resources defined in the cluster.yaml file to your cluster, and also remove any resources that are no longer defined in the file.

> NOTE: By default, the kubectl apply command does not remove resources that are no longer defined in the manifests. By adding the --prune flag, you are telling kubectl to remove any resources that are no longer present in the manifests.
