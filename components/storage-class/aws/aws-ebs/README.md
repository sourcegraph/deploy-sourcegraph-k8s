# # Storageclass Component for AWS EKS

For more information, please refer to our documentation on [configuring a storage class for your cloud provider](https://docs.sourcegraph.com/admin/deploy/kubernetes/configure#configure-a-storage-class).

This component:

- creates storage class for aws
- sets the provisioner to `kubernetes.io/aws-ebs`.

Use this provisioner when using the Amazon EKS add-on
Hello World
