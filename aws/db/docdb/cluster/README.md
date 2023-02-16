# AWS `docdb-cluster` Terraform Module Usage Guide

## Usage

```
module "docdb" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/db/docdb/cluster?ref=v0.0.1"

  environment  = var.environment_name
  friendly_name = "testproject"

  db_engine_version = "4.0.0"
  db_instance_class = "db.t3.medium"
  db_instance_count = 2

  subnets_list         = [data.aws_subnet.a-1.id, data.aws_subnet.b-1.id, data.aws_subnet.c-1.id]
  security_groups_list = [data.aws_security_group.this.id]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_docdb_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster) | resource |
| [aws_docdb_cluster_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_instance) | resource |
| [aws_docdb_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_subnet_group) | resource |
| [aws_secretsmanager_secret.docdb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.docdb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [random_id.db_suffix](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/id) | resource |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/id) | resource |
| [random_password.docdb](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/password) | resource |
| [random_shuffle.az](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/shuffle) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_list_override"></a> [az\_list\_override](#input\_az\_list\_override) | An optional ordered list of Availability Zones to launch DobDB Cluster Instance(s) in, when provided will override random placement of instances. | `list(string)` | `[]` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The number of days to retain DB backups. Default = 35 | `number` | `35` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | The DocDB Engine Version. Default = 4.0.0 | `string` | `"4.0.0"` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | The Instance Class of databases to be launched. | `string` | `"db.r5.medium"` | no |
| <a name="input_db_instance_count"></a> [db\_instance\_count](#input\_db\_instance\_count) | The number of DocDB Instances to be created in the cluster. If number of instances requested < number of subnets specified, the instances will be placed in subnets selected by alphanumeric order. | `number` | `2` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name this module is deployed into. Default = aws | `string` | `"aws"` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB cluster is deleted. | `string` | `""` | no |
| <a name="input_friendly_name"></a> [friendly\_name](#input\_friendly\_name) | The name of this project, used for resource naming. | `string` | n/a | yes |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | Preferred backup window. Default = 21:00-22:00 | `string` | `"21:00-22:00"` | no |
| <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window) | Preferred maintenance window. Default = Sat:10:00-Sat:11:30 | `string` | `"Sat:10:00-Sat:11:30"` | no |
| <a name="input_security_groups_list"></a> [security\_groups\_list](#input\_security\_groups\_list) | List of Security Groups to be associated with the resource. | `list(string)` | n/a | yes |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted. Default = false | `bool` | `false` | no |
| <a name="input_subnets_list"></a> [subnets\_list](#input\_subnets\_list) | A list of VPC Subnets to be associated with the resources. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_docdb_cluster_arn"></a> [aws\_docdb\_cluster\_arn](#output\_aws\_docdb\_cluster\_arn) | n/a |
| <a name="output_aws_docdb_cluster_cluster_resource_id"></a> [aws\_docdb\_cluster\_cluster\_resource\_id](#output\_aws\_docdb\_cluster\_cluster\_resource\_id) | n/a |
| <a name="output_aws_docdb_cluster_endpoint"></a> [aws\_docdb\_cluster\_endpoint](#output\_aws\_docdb\_cluster\_endpoint) | n/a |
| <a name="output_aws_docdb_cluster_id"></a> [aws\_docdb\_cluster\_id](#output\_aws\_docdb\_cluster\_id) | n/a |
| <a name="output_aws_docdb_cluster_reader_endpoint"></a> [aws\_docdb\_cluster\_reader\_endpoint](#output\_aws\_docdb\_cluster\_reader\_endpoint) | n/a |
| <a name="output_aws_docdb_subnet_group_arn"></a> [aws\_docdb\_subnet\_group\_arn](#output\_aws\_docdb\_subnet\_group\_arn) | n/a |
| <a name="output_aws_docdb_subnet_group_id"></a> [aws\_docdb\_subnet\_group\_id](#output\_aws\_docdb\_subnet\_group\_id) | n/a |
| <a name="output_secrets_arn"></a> [secrets\_arn](#output\_secrets\_arn) | n/a |

## Note

### Placement of Instances

A list of Availability Zones are generated from the list of Subnets provided. This list is randomised, and DocDB Instances are launched in order based on this randomised list of Availability zones.

To override this behaviour, supply an optional input variable `az_list_override` of type `list(string)` with Availability Zone names. Instances will be placed in order of list of Availability Zone supplied.

> az_list_override = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

Length of `az_list_override` does not need to match that of `db_instance_count`.
