# Deploy Sourcegraph on Kubernetes with Kustomize

[![sourcegraph: search](https://img.shields.io/badge/sourcegraph-search-brightgreen.svg)](https://sourcegraph.com/github.com/sourcegraph/deploy-sourcegraph-k8s) [![master build status](https://badge.buildkite.com/018ed23ed79d7297e7dd109b745597c58d875323fb06e81786.svg?branch=main)](https://buildkite.com/sourcegraph/deploy-sourcegraph-k8s)

> **Note**
> This deployment method only supports **Sourcegraph version 4.5.0 and above**.

Deploying Sourcegraph into a Kubernetes cluster is for organizations that need highly scalable and
available code search and code intelligence. This repository contains documentation for creating,
updating, and maintaining a Sourcegraph cluster using Kustomize.

- [Installing](https://docs.sourcegraph.com/admin/deploy/kubernetes)
- [Configuring](https://docs.sourcegraph.com/admin/deploy/kubernetes/configure)
- [Updating](https://docs.sourcegraph.com/admin/updates/kubernetes)
- [Scaling](https://docs.sourcegraph.com/admin/deploy/scale)- general advice on scaling services
- [Resource estimator: instance size](https://docs.sourcegraph.com/admin/deploy/instance-size) - specific resource values for your instance based on your instance size
- [Troubleshooting](https://docs.sourcegraph.com/admin/install/kubernetes/troubleshoot)
- [Enterprise Getting Started Guide](https://docs.sourcegraph.com/adopt/enterprise_getting_started_guide#kubernetes-admin) and [Admin guide](https://docs.sourcegraph.com/admin) - useful guides for Sourcegraph admins
  - [Metrics](https://docs.sourcegraph.com/admin/observability/metrics) - guidance of metrics that can be used for monitoring Sourcegraph

## Deploy

Please refer to the [Sourcegraph Kustomize docs](https://docs.sourcegraph.com/admin/deploy/kubernetes/kustomize) for the latest instructions.

## Upgrade

When upgrading Sourcegraph, please check the [upgrade docs for Kubernetes](https://docs.sourcegraph.com/admin/updates/kubernetes) to confirm if manual migrations is necessary.

## Feedback

We've made our deployment configurations open source to better serve our customers' needs. If there is anything we can do to make deploying Sourcegraph easier just [open an issue (in sourcegraph/sourcegraph)](https://github.com/sourcegraph/sourcegraph/issues/new?assignees=&labels=deploy-sourcegraph-k8s&template=deploy-sourcegraph.md&title=%5Bdeploy-sourcegraph-k8s%5D) or a pull request and we will respond as soon as possible!

## Questions & Issues

[Open an issue (in sourcegraph/sourcegraph)](https://github.com/sourcegraph/sourcegraph/issues/new?assignees=&labels=deploy-sourcegraph-k8s&template=deploy-sourcegraph.md&title=%5Bdeploy-sourcegraph%5D).

For urgent issues, please contact us at support@sourcegraph.com --we are happy to help!

## Licensing

The contents of this repository are open-source licensed. However, it makes reference to non-open-source images and actually running Sourcegraph using this repository falls under Sourcegraph's [enterprise license terms](https://about.sourcegraph.com/pricing/).

For product and [pricing](https://about.sourcegraph.com/pricing/) information, visit
[about.sourcegraph.com](https://about.sourcegraph.com) or [contact
us](https://about.sourcegraph.com/contact/sales) for more information.
