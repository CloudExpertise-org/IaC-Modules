# `aws/efs/fs` Module
Creates an EFS Filesystem to be used by EKS as Persistent Volume Storage.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_efs_backup_policy.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/efs_backup_policy) | resource |
| [aws_efs_file_system.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/efs_file_system) | resource |
| [aws_efs_mount_target.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/efs_mount_target) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/security_group) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_backup_enabled"></a> [aws\_backup\_enabled](#input\_aws\_backup\_enabled) | Enable Automatic AWS Backup on this EFS Filesystem. | `bool` | `true` | no |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | Determines whether the EFS is encrypted at rest, defaults to true. | `bool` | `true` | no |
| <a name="input_lifecycle_enabled"></a> [lifecycle\_enabled](#input\_lifecycle\_enabled) | Enables EFS object lifecycle policy, defaults to true. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the EFS Filesystem. | `string` | n/a | yes |
| <a name="input_performance_mode"></a> [performance\_mode](#input\_performance\_mode) | Performance mode of EFS, defaults to generalPurpose. | `string` | `"generalPurpose"` | no |
| <a name="input_provisioned_throughput"></a> [provisioned\_throughput](#input\_provisioned\_throughput) | If specified, the throughput in MiB/s to provision for the filesystem. Defaults to null, which provisions the EFS in bursting mode. | `string` | `null` | no |
| <a name="input_subnets_list"></a> [subnets\_list](#input\_subnets\_list) | A list of subnets to create EFS Mount Targets for. | `list(string)` | n/a | yes |
| <a name="input_transition_to_ia"></a> [transition\_to\_ia](#input\_transition\_to\_ia) | Lifecycle rule to transition files to IA storage class. Valid values: AFTER\_{7,14,30,60,90}\_DAYS. Defaults to AFTER\_30\_DAYS. | `string` | `"AFTER_30_DAYS"` | no |
| <a name="input_transition_to_primary_storage_class"></a> [transition\_to\_primary\_storage\_class](#input\_transition\_to\_primary\_storage\_class) | Lifecycle policy to transition files from IA to primary storage. Valid values: AFTER\_1\_ACCESS. Defaults to AFTER\_1\_ACCESS. | `string` | `"AFTER_1_ACCESS"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of EFS Filesystem. |
| <a name="output_dns"></a> [dns](#output\_dns) | The DNS Name of EFS Filesystem. |
| <a name="output_id"></a> [id](#output\_id) | The ID of EFS Filesystem. |
| <a name="output_mount_targets_dns"></a> [mount\_targets\_dns](#output\_mount\_targets\_dns) | The DNS Name of Mount Targets created. |
| <a name="output_security_groups"></a> [security\_groups](#output\_security\_groups) | The Security Groups created for each VPC supplied. |
