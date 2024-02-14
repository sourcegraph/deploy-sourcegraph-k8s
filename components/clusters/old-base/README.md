# Old base cluster component

This component configure current base cluster using the configurations for the old base cluster

It updates and generates resources from the old cluster includes:

    - the monitoring stack and cadvisor
    - searcher and symbols as Deployment
    - run as root, privilieged
    - include RBAC resources

This should only be used to generate old cluster for comparision purpose.

Check out the `examples/old-cluster` directory to see how this component is used.
Hello World
