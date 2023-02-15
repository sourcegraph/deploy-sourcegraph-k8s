#!/bin/bash

set -ex
cd "$(dirname "${BASH_SOURCE[0]}")/.."

gcloud container clusters get-credentials cloud --zone us-central1-f --project sourcegraph-dev

kubectl kustomize ./base/. | kubectl apply --dry-run --validate --context=gke_sourcegraph-dev_us-central1-f_cloud -f -

.buildkite/verify-label.sh
