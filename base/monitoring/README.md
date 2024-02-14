# Sourcegraph Monitoring Stack

The monitoring stacks include the following services:

- grafana
- node-exporter
- prometheus
- otel-collector

cAdvisor is not included in the monitoring stack by default.

## cAdvisor

cAdvisor must be run as root in a Kubernetes cluster with role-based access control (RBAC) enabled to collect metrics.

You can add the cadvisor component to your overlay to deploy cAdvisor.
Hello World
