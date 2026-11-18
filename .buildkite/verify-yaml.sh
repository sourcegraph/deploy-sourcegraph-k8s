#!/bin/bash

set -exo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

# Validate the rendered manifests against the Kubernetes schemas offline. This
# used to be a server-side dry run against the old dotcom cluster, which is
# being removed.
KUBECONFORM_VERSION=0.6.7
KUBERNETES_VERSION=1.33.0

bin="$(mktemp -d)"
trap 'rm -rf "$bin"' EXIT
curl -sSfL "https://github.com/yannh/kubeconform/releases/download/v${KUBECONFORM_VERSION}/kubeconform-linux-amd64.tar.gz" |
  tar -xz -C "$bin" kubeconform

kubectl kustomize ./base/. |
  "$bin/kubeconform" -strict -summary -kubernetes-version "$KUBERNETES_VERSION"

.buildkite/verify-label.sh
