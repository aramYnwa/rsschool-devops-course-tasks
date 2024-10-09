# rsschool-devops-course-tasks

### Install the aws cli and terraform

AWS

```json

{
    "InstanceTypes": [
        {
            "InstanceType": "t4g.nano",
            "CurrentGeneration": true,
            "FreeTierEligible": false,
            "SupportedUsageClasses": [
                "on-demand",
                "spot"
            ],
            "SupportedRootDeviceTypes": [
                "ebs"
            ],
            "SupportedVirtualizationTypes": [
                "hvm"
            ],
            "BareMetal": false,
            "Hypervisor": "nitro",
            "ProcessorInfo": {
                "SupportedArchitectures": [
                    "arm64"
                ],
                "SustainedClockSpeedInGhz": 2.5,
                "Manufacturer": "AWS"
            },
            "VCpuInfo": {
                "DefaultVCpus": 2,
                "DefaultCores": 2,
                "DefaultThreadsPerCore": 1,
                "ValidCores": [
                    1,
                    2
                ],
                "ValidThreadsPerCore": [
                    1
                ]
            },
            "MemoryInfo": {
                "SizeInMiB": 512
            },
            "InstanceStorageSupported": false,
            "EbsInfo": {
                "EbsOptimizedSupport": "default",
                "EncryptionSupport": "supported",
                "EbsOptimizedInfo": {
                    "BaselineBandwidthInMbps": 43,
                    "BaselineThroughputInMBps": 5.375,
                    "BaselineIops": 250,
                    "MaximumBandwidthInMbps": 2085,
                    "MaximumThroughputInMBps": 260.625,
                    "MaximumIops": 11800
                },
                "NvmeSupport": "required"
            },
            "NetworkInfo": {
                "NetworkPerformance": "Up to 5 Gigabit",
                "MaximumNetworkInterfaces": 2,
                "MaximumNetworkCards": 1,
                "DefaultNetworkCardIndex": 0,
                "NetworkCards": [
                    {
                        "NetworkCardIndex": 0,
                        "NetworkPerformance": "Up to 5 Gigabit",
                        "MaximumNetworkInterfaces": 2,
                        "BaselineBandwidthInGbps": 0.032,
                        "PeakBandwidthInGbps": 5.0
                    }
                ],
                "Ipv4AddressesPerInterface": 2,
                "Ipv6AddressesPerInterface": 2,
                "Ipv6Supported": true,
                "EnaSupport": "required",
                "EfaSupported": false,
                "EncryptionInTransitSupported": false,
                "EnaSrdSupported": false
            },
            "PlacementGroupInfo": {
                "SupportedStrategies": [
                    "partition",
                    "spread"
                ]
            },
            "HibernationSupported": true,
            "BurstablePerformanceSupported": true,
            "DedicatedHostsSupported": false,
            "AutoRecoverySupported": true,
            "SupportedBootModes": [
                "uefi"
            ],
            "NitroEnclavesSupport": "unsupported",
            "NitroTpmSupport": "supported",
            "NitroTpmInfo": {
                "SupportedVersions": [
                    "2.0"
                ]
            },
            "PhcSupport": "unsupported"
        }
    ]
}
```

Terraform

```bash
terraform version
Terraform v1.9.6
on linux_amd64

Your version of Terraform is out of date! The latest version
is 1.9.7. You can update by downloading from https://www.terraform.io/downloads.html
```


### Setup the IAM in AWS

1. Created a new user with required permissions. Enabled the 2MFA

### Setup identify provider and GithubActionsRole

1. Created a new identity provider for github.
2. Created a new role with required policy to access my github repo and attached the required permissions. The configuration can be found in iam_role.tf file.

### Setup github actions
1. Created a workflow for github that will be triggered any time we have a PR to main or push to the main branch.
2. Created repo secrets to store AWS KEY_ID and SECRET.

### Confirmed the workflow works.
The logfile of a workflow is also attached as part of the PR.
