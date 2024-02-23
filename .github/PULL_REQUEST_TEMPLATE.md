## Description

<!-- description here -->

---

## Checklist

<!--
  Kubernetes, both Kustomize and Helm, and Docker Compose MUST be kept in sync.
  You should not merge a change here without a corresponding change in the other repositories,
  unless it is specific to this deployment type. If uneeded, add link or explanation of why it is not needed here.
-->

- [ ] Update [CHANGELOG.md](https://github.com/sourcegraph/sourcegraph/blob/main/CHANGELOG.md)
- [ ] Update [K8s Upgrade notes](https://github.com/sourcegraph/sourcegraph/blob/main/doc/admin/updates/kubernetes.md)
- [ ] Kustomiz-specific changes
- [ ] Update sister repository: [deploy-sourcegraph-helm](https://github.com/sourcegraph/deploy-sourcegraph-helm)
- [ ] Update sister repository: [deploy-sourcegraph-docker](https://github.com/sourcegraph/deploy-sourcegraph-docker)
- [ ] Verify all images have a valid tag and SHA256 sum

## Test plan

<!--
  As part of SOC2/GN-104 and SOC2/GN-105 requirements, all pull requests are REQUIRED to
  provide a "test plan". A test plan is a loose explanation of what you have done or
  implemented to test this, as outlined in our Testing principles and guidelines:
  https://docs.sourcegraph.com/dev/background-information/testing_principles
  Write your test plan here after the "Test plan" header.
-->
