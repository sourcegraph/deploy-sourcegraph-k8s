#!/usr/bin/env bash

set -e

root_dir="$(dirname "${BASH_SOURCE[0]}")/.."
cd "$root_dir"

CONSTRAINT=$1

go run .buildkite/tools/enforce-tags "$CONSTRAINT" base/
go run .buildkite/tools/enforce-tags "$CONSTRAINT" examples/
