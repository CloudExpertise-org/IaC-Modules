# AWS `rds/aurora` Terraform Module Usage Guide

> This document is best generated systematically, until that is ready this is manually written.

## Usage

`Aurora PostgreSQL`:
```
module "aurora_postgresql" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/db/rds/aurora?ref=v0.0.45"

  environment  = var.environment_name
  friendly_name = "testproject"

  db_engine         = "aurora-postgresql"
  db_engine_version = "11.9"
  db_instance_class = "db.r5.large"
  db_instance_count = 2

  subnets_list         = [data.aws_subnet.a-1.id, data.aws_subnet.b-1.id, data.aws_subnet.c-1.id]
  security_groups_list = [data.aws_security_group.this.id]
}
```

`Aurora MySQL`:
```
module "aurora_mysql" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/db/rds/aurora?ref=v0.0.45"

  environment   = var.environment_name
  friendly_name = "testproject"

  db_engine         = "aurora-mysql"
  db_engine_version = "5.7.mysql_aurora.2.10.1"
  db_instance_class = "db.t3.large"
  db_instance_count = 1

  subnets_list         = [data.aws_subnet.a-1.id, data.aws_subnet.b-1.id, data.aws_subnet.c-1.id]
  security_groups_list = [data.aws_security_group.this.id]

  performance_insights_enabled = false
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
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_rds_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_secretsmanager_secret.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [random_id.rds_suffix](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/id) | resource |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/id) | resource |
| [random_password.rds](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/password) | resource |
| [random_shuffle.az](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/shuffle) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Allow major version upgrade or not. Default = false (boolean) | `bool` | `false` | no |
| <a name="input_az_list_override"></a> [az\_list\_override](#input\_az\_list\_override) | An optional ordered list of Availability Zones to launch RDS Cluster Instance(s) in, when provided will override random placement of instances. | `list(string)` | `[]` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The number of days to retain DB backups. Default = 35 | `number` | `35` | no |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | The RDS Aurora DB Enginer. Default = aurora-postgresql | `string` | `"aurora-postgresql"` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | The RDS Aurora DB Engine Version. Default = 11.9 | `string` | `"11.9"` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | The Instance Class of databases to be launched. | `string` | `"db.r5.large"` | no |
| <a name="input_db_instance_count"></a> [db\_instance\_count](#input\_db\_instance\_count) | The number of RDS Instances to be created in the cluster. If number of instances requested < number of subnets specified, the instances will be placed in subnets selected by alphanumeric order. | `number` | `2` | no |
| <a name="input_db_name_override"></a> [db\_name\_override](#input\_db\_name\_override) | The name of the database to be created. | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name this module is deployed into. Default = aws | `string` | `"aws"` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB cluster is deleted. | `string` | `""` | no |
| <a name="input_friendly_name"></a> [friendly\_name](#input\_friendly\_name) | The name of this project, used for resource naming. | `string` | n/a | yes |
| <a name="input_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#input\_iam\_database\_authentication\_enabled) | Enable IAM Database Authentication or not. Default = true (boolean) | `bool` | `true` | no |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | The master username of this database cluster. If supplied overrides default value of admin. | `string` | `"admin"` | no |
| <a name="input_performance_insights_enabled"></a> [performance\_insights\_enabled](#input\_performance\_insights\_enabled) | Enable performance insight or not. Default = true (boolean) | `bool` | `true` | no |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | Preferred backup window. Default = 21:00-22:00 | `string` | `"21:00-22:00"` | no |
| <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window) | Preferred maintenance window. Default = Sat:10:00-Sat:11:30 | `string` | `"Sat:10:00-Sat:11:30"` | no |
| <a name="input_security_groups_list"></a> [security\_groups\_list](#input\_security\_groups\_list) | List of Security Groups to be associated with the resource. | `list(string)` | n/a | yes |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether creation of final DB snapshot is skipped when the DB cluster is deleted. Default = false | `bool` | `false` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Enable storage encryption or not. Default = true (boolean) | `bool` | `true` | no |
| <a name="input_subnets_list"></a> [subnets\_list](#input\_subnets\_list) | A list of VPC Subnets to be associated with the resources. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_db_subnet_group_arn"></a> [aws\_db\_subnet\_group\_arn](#output\_aws\_db\_subnet\_group\_arn) | n/a |
| <a name="output_aws_db_subnet_group_id"></a> [aws\_db\_subnet\_group\_id](#output\_aws\_db\_subnet\_group\_id) | n/a |
| <a name="output_aws_rds_cluster_arn"></a> [aws\_rds\_cluster\_arn](#output\_aws\_rds\_cluster\_arn) | n/a |
| <a name="output_aws_rds_cluster_database_name"></a> [aws\_rds\_cluster\_database\_name](#output\_aws\_rds\_cluster\_database\_name) | n/a |
| <a name="output_aws_rds_cluster_endpoint"></a> [aws\_rds\_cluster\_endpoint](#output\_aws\_rds\_cluster\_endpoint) | n/a |
| <a name="output_aws_rds_cluster_engine"></a> [aws\_rds\_cluster\_engine](#output\_aws\_rds\_cluster\_engine) | n/a |
| <a name="output_aws_rds_cluster_id"></a> [aws\_rds\_cluster\_id](#output\_aws\_rds\_cluster\_id) | n/a |
| <a name="output_aws_rds_cluster_identifier"></a> [aws\_rds\_cluster\_identifier](#output\_aws\_rds\_cluster\_identifier) | n/a |
| <a name="output_aws_rds_cluster_master_username"></a> [aws\_rds\_cluster\_master\_username](#output\_aws\_rds\_cluster\_master\_username) | n/a |
| <a name="output_aws_rds_cluster_port"></a> [aws\_rds\_cluster\_port](#output\_aws\_rds\_cluster\_port) | n/a |
| <a name="output_aws_rds_cluster_reader_endpoint"></a> [aws\_rds\_cluster\_reader\_endpoint](#output\_aws\_rds\_cluster\_reader\_endpoint) | n/a |
| <a name="output_aws_rds_cluster_resource_id"></a> [aws\_rds\_cluster\_resource\_id](#output\_aws\_rds\_cluster\_resource\_id) | n/a |
| <a name="output_secrets_arn"></a> [secrets\_arn](#output\_secrets\_arn) | n/a |

## Note

### Tested DB Engine Configurations

The following parameters have been tested to work with this rds-cluster module.

| DB Engine | DB Engine Version | DB Instance Class | performance_insights_enabled |
| --------- | ----------------- | ----------------- | ---------------------------- |
| aurora-postgresql | 11.9 | db.r5.large | true |
| aurora-mysql | 5.7.mysql_aurora.2.10.1 | db.t3.large | false |

### Placement of Instances

A list of Availability Zones are generated from the list of Subnets provided. This list is randomised, and RDS Instances are launched in order based on this randomised list of Availability zones.

To override this behaviour, supply an optional input variable `az_list_override` of type `list(string)` with Availability Zone names. Instances will be placed in order of list of Availability Zone supplied.

> az_list_override = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

Length of `az_list_override` does not need to match that of `db_instance_count`.

### Performance Insights

Performance Insights is not supported by some Aurora MySQL-Compatible Edition versions and DB Instance Classes.

When launching aurora-mysql clusters, refer to the following documentation for limitations.

> https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights.Overview.Engines.html
