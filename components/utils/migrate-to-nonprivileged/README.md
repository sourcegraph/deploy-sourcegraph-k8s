This kustomization injects initContainers in all pods with persistent volumes to transfer ownership of directories to
specified non-root users. It is used for migrating existing installations to a non-root environment.
