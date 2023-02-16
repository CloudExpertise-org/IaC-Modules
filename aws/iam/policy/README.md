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
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policy_description"></a> [policy\_description](#input\_policy\_description) | The description of the IAM policy. | `string` | `null` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | The name of the IAM policy. | `string` | n/a | yes |
| <a name="input_policy_path"></a> [policy\_path](#input\_policy\_path) | The path of the IAM policy. | `string` | `"/"` | no |
| <a name="input_policy_statements"></a> [policy\_statements](#input\_policy\_statements) | A list of maps of statements of the IAM policy. | <pre>list(object({<br>    sid       = string<br>    actions   = list(string)<br>    resources = list(string)<br>    effect    = string<br>  }))</pre> | <pre>[<br>  {<br>    "actions": [<br>      "null"<br>    ],<br>    "effect": "Deny",<br>    "resources": [<br>      "*"<br>    ],<br>    "sid": "null"<br>  }<br>]</pre> | no |
| <a name="input_policy_statements_json"></a> [policy\_statements\_json](#input\_policy\_statements\_json) | A json string object containing the content of IAM policy. Used in place of policy\_statements. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of this policy. |
| <a name="output_id"></a> [id](#output\_id) | The ID of this policy. |
| <a name="output_path"></a> [path](#output\_path) | The path of this policy. |
| <a name="output_policy"></a> [policy](#output\_policy) | The policy document of the policy. |
