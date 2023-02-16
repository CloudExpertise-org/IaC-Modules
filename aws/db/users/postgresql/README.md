## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.67.0 |
| <a name="requirement_postgresql"></a> [postgresql](#requirement\_postgresql) | 1.16.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.67.0 |
| <a name="provider_postgresql"></a> [postgresql](#provider\_postgresql) | 1.16.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/secretsmanager_secret_version) | resource |
| [postgresql_database.this](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.16.0/docs/resources/database) | resource |
| [postgresql_grant.this](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.16.0/docs/resources/grant) | resource |
| [postgresql_role.this](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.16.0/docs/resources/role) | resource |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/id) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/password) | resource |
| [aws_secretsmanager_secret.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_connect_timeout"></a> [db\_connect\_timeout](#input\_db\_connect\_timeout) | DB Connect Timeout. | `number` | `15` | no |
| <a name="input_db_database_name"></a> [db\_database\_name](#input\_db\_database\_name) | PostgreSQL database name to access. | `string` | n/a | yes |
| <a name="input_db_host"></a> [db\_host](#input\_db\_host) | Access endpoint of Database. | `string` | n/a | yes |
| <a name="input_db_password_ssm_arn"></a> [db\_password\_ssm\_arn](#input\_db\_password\_ssm\_arn) | AWS SSM ARN that contains password to authenticate to Database. | `string` | n/a | yes |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | Access port of Database. | `string` | n/a | yes |
| <a name="input_db_sslmode"></a> [db\_sslmode](#input\_db\_sslmode) | DB SSL Mode. | `string` | `"require"` | no |
| <a name="input_db_superuser"></a> [db\_superuser](#input\_db\_superuser) | Defines whether user is superuser. | `bool` | `false` | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | Username to authenticate to Database. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name this module is deployed into. Default = aws | `string` | `"aws"` | no |
| <a name="input_new_user_db_allow_connections"></a> [new\_user\_db\_allow\_connections](#input\_new\_user\_db\_allow\_connections) | Allow connections for new DB for user. | `bool` | `true` | no |
| <a name="input_new_user_db_connection_limit"></a> [new\_user\_db\_connection\_limit](#input\_new\_user\_db\_connection\_limit) | Connection limit of new DB for user. | `number` | `null` | no |
| <a name="input_new_user_db_lc_collate"></a> [new\_user\_db\_lc\_collate](#input\_new\_user\_db\_lc\_collate) | lc\_collate of new DB for user. | `string` | `null` | no |
| <a name="input_new_user_db_name"></a> [new\_user\_db\_name](#input\_new\_user\_db\_name) | Name of new Database to be created for new user. Optional, if supplied overrides default new DB name. | `string` | `null` | no |
| <a name="input_new_user_db_template"></a> [new\_user\_db\_template](#input\_new\_user\_db\_template) | Template to create new DB for user. | `string` | `null` | no |
| <a name="input_new_user_name"></a> [new\_user\_name](#input\_new\_user\_name) | Name of new user to be created. Also default as the name of new Database to be created for user. | `string` | n/a | yes |
| <a name="input_new_user_roles_list"></a> [new\_user\_roles\_list](#input\_new\_user\_roles\_list) | List of roles to be granted to this new user. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database"></a> [database](#output\_database) | Name of new DB for this user. |
| <a name="output_password_ssm_arn"></a> [password\_ssm\_arn](#output\_password\_ssm\_arn) | AWS SSM where the password is stored. |
| <a name="output_username"></a> [username](#output\_username) | Name of new DB user. |
