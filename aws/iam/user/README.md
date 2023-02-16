# AWS `iam/user` Terraform Module Usage Guide

## Usage

```
module "iam-user" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/iam/user?ref=v0.0.1"

  iam_user_name              = var.iam_user_name
  policy_attachment_arns     = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"]
}
```

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
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/iam_user_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_user_name"></a> [iam\_user\_name](#input\_iam\_user\_name) | The name of the IAM user to be created. | `string` | n/a | yes |
| <a name="input_policy_attachment_arns"></a> [policy\_attachment\_arns](#input\_policy\_attachment\_arns) | List of IAM Policy ARNs to be attached to this IAM user. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of IAM role created. |
| <a name="output_creation_date"></a> [creation\_date](#output\_creation\_date) | The date this IAM role was created. |
| <a name="output_id"></a> [id](#output\_id) | The name of the IAM role created. |
| <a name="output_instance_profile_arn"></a> [instance\_profile\_arn](#output\_instance\_profile\_arn) | The ARN of IAM Instance Profile. |
| <a name="output_instance_profile_id"></a> [instance\_profile\_id](#output\_instance\_profile\_id) | The ID of IAM Instance Profile. |
| <a name="output_name"></a> [name](#output\_name) | The name of the IAM role created. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource. |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | The unique string identifying this IAM role. |
