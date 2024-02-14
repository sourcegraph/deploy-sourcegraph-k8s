# SSDs

Using local SSDs dramatically speeds up many of Sourcegraph's services. Even if the cluster's default storage class uses SSDs, it's likely network-mounted rather than local. Read your cloud provider's documentation for mouting local SSDs.

- [GCP](https://cloud.google.com/compute/docs/disks/local-ssd)
- [AWS](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ssd-instance-store.html)

If you mount local SSDs on your nodes:

This component changes the `cache-ssd` volume to point to `${SSD_NODE_PATH}/pod-tmp` where `${SSD_NODE_PATH}` is the absolute path of the SSD on each node.

For example, GCP mounts the first SSD disk to `/mnt/disks/ssd0`, so the `cache-ssd` volume would be configured like this:

```yaml
volumes:
  - hostPath:
      path: /mnt/disks/ssd0/pod-tmp
    name: cache-ssd
```

This component should be run periodically to clean up files in the SSD on each node. This is necessary because files on the SSDs are not automatically cleaned up if pods crash or are rescheduled which can cause the SSDs to fill up.

## How to use

Define the $SSD_NODE_PATH variable in your OVERLAY CONFIGURATIONS.
Hello World
