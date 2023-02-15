#!/usr/bin/env bash

set -eu
pushd "$(dirname "${BASH_SOURCE[0]}")"/..

OVERLAYS=()
mapfile -t OVERLAYS < <(find examples -maxdepth 2 -type d ! -name '.*' ! -name 'monitoring' ! -name 'ingress-controller' -printf '%f\n')

for O in "${OVERLAYS[@]}"; do
  echo "<<<< GENERATING ${O} OVERLAY >>>>>"
  DIR=generated-cluster
  mkdir "${DIR}"
  kubectl kustomize examples/"${O}" -o "${DIR}"
  rm -rf "${DIR}"
done
