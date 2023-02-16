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
| [aws_ssm_document.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/ssm_document) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_document_content"></a> [document\_content](#input\_document\_content) | The content of SSM document to be created. | `string` | `null` | no |
| <a name="input_document_format"></a> [document\_format](#input\_document\_format) | Format of SSM content to be supplied, valid values are YAML or JSON. | `string` | `"YAML"` | no |
| <a name="input_document_type"></a> [document\_type](#input\_document\_type) | Type of SSM document to be created, defaults to Command. | `string` | `"Command"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the SSM Document. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The name of SSM document created. |
| <a name="output_version_default"></a> [version\_default](#output\_version\_default) | The default version of this document. |
| <a name="output_version_latest"></a> [version\_latest](#output\_version\_latest) | The latest version of this document. |
