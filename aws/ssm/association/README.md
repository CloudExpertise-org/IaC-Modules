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
| [aws_ssm_association.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/ssm_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_only_at_cron_interval"></a> [apply\_only\_at\_cron\_interval](#input\_apply\_only\_at\_cron\_interval) | Determines if this assocication should be run immediately after association, defaults to false (don't apply till next cron time). | `bool` | `false` | no |
| <a name="input_cron"></a> [cron](#input\_cron) | The cron expression for this association. | `string` | `null` | no |
| <a name="input_max_concurrency"></a> [max\_concurrency](#input\_max\_concurrency) | The max cocurrency of this association. | `string` | `"50%"` | no |
| <a name="input_max_errors"></a> [max\_errors](#input\_max\_errors) | The maximum number of errors allowed before stop sending requests to run association. | `string` | `"50%"` | no |
| <a name="input_ssm_document_name"></a> [ssm\_document\_name](#input\_ssm\_document\_name) | Name of SSM Document to be associated with. | `string` | n/a | yes |
| <a name="input_ssm_document_version"></a> [ssm\_document\_version](#input\_ssm\_document\_version) | The version of SSM Document to use. | `string` | `null` | no |
| <a name="input_target_key"></a> [target\_key](#input\_target\_key) | The Key to be used for this association. | `string` | n/a | yes |
| <a name="input_target_values_list"></a> [target\_values\_list](#input\_target\_values\_list) | A list of values to be associated with. | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_association_id"></a> [association\_id](#output\_association\_id) | The ID of this association. |
| <a name="output_id"></a> [id](#output\_id) | The ID of this association. |
