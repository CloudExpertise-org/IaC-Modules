# AWS `iam/role` Terraform Module Usage Guide

## Usage

```
module "iam-role-eks-cluster" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/iam/role?ref=v0.0.1"

  role_name                    = "eks-role"
  policy_attachment_arns       = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"]
  assume_role_allowed_services = ["eks.amazonaws.com"]
  permissions_boundary         = var.permissions_boundary
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
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/iam_role_policy_attachment) | resource |



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_allowed_services"></a> [assume\_role\_allowed\_services](#input\_assume\_role\_allowed\_services) | List of services allowed to assume this role, i.e., ["ec2.amazonaws.com", "eks.amazonaws.com"]. | `list(string)` | n/a | yes |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | The ARN of the policy that is used to set the permissions boundary for the role. | `any` | n/a | yes |
| <a name="input_policy_attachment_arns"></a> [policy\_attachment\_arns](#input\_policy\_attachment\_arns) | List of IAM Policy ARNs to be attached to this role. | `list(string)` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name of the IAM role to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of IAM role created. |
| <a name="output_creation_date"></a> [creation\_date](#output\_creation\_date) | The date this IAM role was created. |
| <a name="output_id"></a> [id](#output\_id) | The name of the IAM role created. |
| <a name="output_name"></a> [name](#output\_name) | The name of the IAM role created. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource. |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | The unique string identifying this IAM role. |
