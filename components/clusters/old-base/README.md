# Old base cluster component

This component configure current base cluster using the configurations for the old base cluster

It updates and generates resources from the old cluster includes:

    - the monitoring stack and cAdvisor
    - searcher and symbols as Deployment
    - run as root, privileged
    - include RBAC resources

This should only be used to generate old cluster for comparison purpose.

Check out the `examples/old-cluster` directory to see how this component is used.
