# AGENTS.md

Guidance for coding agents working in this repository.

## What this repo is

`deploy-sourcegraph-k8s` holds Kustomize manifests for deploying Sourcegraph
on Kubernetes. It is primarily declarative YAML, with a few small Go helper
tools used in CI. There is no application server to build here.

> Note: this Kustomize deployment method is planned for deprecation in favor of
> Helm. See `README.md`.

## Where the code lives

- `base/` — base Kustomize resources (`kubectl kustomize ./base`), including `base/monitoring` and `base/sourcegraph`.
- `components/` — reusable Kustomize components (sizes, storage-class, network, ingress, executors, etc.) layered onto overlays.
- `examples/` — ready-made overlays per environment/provider (aws, gke, k3s, minikube, demo, …).
- `instances/` — where users create their own overlay; copy from `instances/template`.
- `.buildkite/` — CI pipeline (`pipeline.yaml`), verification shell scripts, and Go tools under `.buildkite/tools` and `.buildkite/verify-release`.

## Toolchain

Tool versions are pinned in `.tool-versions` (managed via mise/asdf): Go 1.21.5,
kustomize 4.5.7, kubectl 1.25.9, shfmt 3.1.0, Node 20.8.1, yarn 1.22.4,
github-cli 2.46.0.

## Common commands

Render/validate manifests:

```bash
# render the base
kubectl kustomize ./base/.

# render an example overlay (e.g. gke)
kubectl kustomize examples/gke
```

CI checks (run from the repo root; mirror `.buildkite/pipeline.yaml`):

```bash
.buildkite/verify-yaml.sh          # kustomize build + kubectl dry-run apply (needs cluster creds)
.buildkite/verify-label.sh         # every base manifest must have metadata.labels.deploy == sourcegraph
.buildkite/verify-rbac-labels.sh   # RBAC label checks
.buildkite/verify-overlays.sh      # kustomize-render every overlay under examples/
.buildkite/check-image-names.sh    # validate image names in base manifests
.buildkite/verify-release/verify-release.sh
```

Go helper tools (have unit tests):

```bash
cd .buildkite/tools/check-image-names && go test ./...
```

## Conventions

- Every resource manifest under `base/` (except `kustomization.yaml`) must carry the label `metadata.labels.deploy: sourcegraph` — enforced by `verify-label.sh`.
- Add new overlays under `examples/<name>/` or `instances/<name>/`; `verify-overlays.sh` will render each one.
- Format shell scripts with `shfmt` (version pinned in `.tool-versions`).
- Releases are driven by branch naming and `release.yaml` / `sg release` in CI; do not change branch-name patterns in `.buildkite/pipeline.yaml` without updating release tooling.
