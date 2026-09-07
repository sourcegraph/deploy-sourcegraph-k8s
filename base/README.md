# Sourcegraph Kubernetes Base Cluster

The `sourcegraph` directory contains manifests for all services for the Sourcegraph main stack.

The `monitoring` directory contains manifests for all Sourcegraph monitoring services.

## RBAC

In our base cluster, all services run with non-root and non-privileged. Role-Based Access Control (RBAC) resources are also not enabled by default, which results in manual mapping of service addresses through environment variables being the only way to discover services. However, these service addresses have been preconfigured in the base cluster.

To enable automatic service discovery and clean up of temporary cache data, RBAC resources must be created using the `privileged` component or the `enable/service-discovery` component.

### cAdvisor

For the cadvisor to function properly in your deployment, a Kubernetes cluster with role-based access control (RBAC) enabled is required.

If using cluster roles and cluster rolebinding RBAC is not feasible, you may choose to deploy Sourcegraph without cadvisor as it will not work in your cluster without RBAC enabled.

## Deploy Sourcegraph

See the [Sourcegraph Kustomize docs](https://docs.sourcegraph.com/admin/deploy/kubernetes/kustomize) for the latested instructions.

## Shared object storage

The base configures the bundled blobstore for shared Sourcegraph uploads. The
`sourcegraph-upload` ConfigMap is consumed by exactly `sourcegraph-frontend`,
`worker`, `precise-code-intel-worker`, `syntactic-code-intel`, `gitserver`, and
`searcher`.

To use external S3 or GCS storage, patch that ConfigMap in your overlay with
the applicable `SOURCEGRAPH_UPLOAD_*` settings. Put static credentials in a
Secret rather than the ConfigMap, and add that Secret with `envFrom` to each
of the six workloads. For example:

```yaml
patches:
  - target:
      kind: ConfigMap
      name: sourcegraph-upload
    patch: |-
      - op: replace
        path: /data/SOURCEGRAPH_UPLOAD_BACKEND
        value: S3
      - op: add
        path: /data/SOURCEGRAPH_UPLOAD_BUCKET
        value: my-sourcegraph-uploads
      - op: add
        path: /data/SOURCEGRAPH_UPLOAD_AWS_REGION
        value: us-east-1
  - target:
      kind: Deployment
      name: sourcegraph-frontend|worker|precise-code-intel-worker|syntactic-code-intel
    patch: &uploadCredentials |-
      - op: add
        path: /spec/template/spec/containers/0/envFrom/-
        value:
          secretRef:
            name: sourcegraph-upload-credentials
  - target:
      kind: StatefulSet
      name: gitserver|searcher
    patch: *uploadCredentials
```

Create `sourcegraph-upload-credentials` with keys such as
`SOURCEGRAPH_UPLOAD_AWS_ACCESS_KEY_ID` and
`SOURCEGRAPH_UPLOAD_AWS_SECRET_ACCESS_KEY`. Alternatively, configure the pod
service accounts for your cloud provider's workload identity and set
`SOURCEGRAPH_UPLOAD_AWS_USE_EC2_ROLE_CREDENTIALS: "true"` for S3. For GCS,
set `SOURCEGRAPH_UPLOAD_GCP_PROJECT_ID`; workload identity uses the pod service
account, while a key can be supplied with
`SOURCEGRAPH_UPLOAD_GOOGLE_APPLICATION_CREDENTIALS_FILE_CONTENT` in the
credentials Secret.
