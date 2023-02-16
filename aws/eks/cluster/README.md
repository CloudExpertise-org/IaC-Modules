# AWS Terraform `aws/eks/cluster` Module

This module provisions an EKS cluster.

```
module "eks-cluster" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/eks/cluster?ref=v0.0.1"

  eks_cluster_name = "${var.env_name_short}-eks"
  eks_role_arn     = module.iam-role-eks-cluster.arn
  eks_version      = var.eks_version

  subnet_ids = [for subnet in module.vpc.subnets.workload : subnet.id]
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
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/eks_cluster) | resource |
| [aws_security_group.cluster](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/security_group) | resource |
| [aws_security_group_rule.inbound](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.outbound](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/security_group_rule) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_security_group_ids"></a> [additional\_security\_group\_ids](#input\_additional\_security\_group\_ids) | List of Security Group IDs for the EKS control plane. | `list(string)` | `[]` | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | The name of the EKS cluster to be created. | `string` | n/a | yes |
| <a name="input_eks_role_arn"></a> [eks\_role\_arn](#input\_eks\_role\_arn) | The IAM Role ARN that provides permission for the EKS control plane. | `string` | n/a | yes |
| <a name="input_eks_version"></a> [eks\_version](#input\_eks\_version) | The Kubernetes version of EKS cluster to be created. | `string` | n/a | yes |
| <a name="input_enabled_cluster_log_types"></a> [enabled\_cluster\_log\_types](#input\_enabled\_cluster\_log\_types) | List of desired control plane logging to enable. | `list(string)` | <pre>[<br>  "api",<br>  "audit",<br>  "authenticator",<br>  "controllerManager",<br>  "scheduler"<br>]</pre> | no |
| <a name="input_endpoint_private_access"></a> [endpoint\_private\_access](#input\_endpoint\_private\_access) | Defines whether EKS private API server endpoint is enabled. Default = true. | `bool` | `true` | no |
| <a name="input_endpoint_public_access"></a> [endpoint\_public\_access](#input\_endpoint\_public\_access) | Defines whether EKS public API server endpoint is enabled. Default = true. | `bool` | `true` | no |
| <a name="input_public_access_cidrs"></a> [public\_access\_cidrs](#input\_public\_access\_cidrs) | List of CIDR to be permitted to access EKS public API endpoint. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The VPC Subnet IDs to associate with the EKS cluster. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of resource tags to be associated with the EKS cluster. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_additional_security_groups"></a> [additional\_security\_groups](#output\_additional\_security\_groups) | List of additional Security Groups created for / assigned to EKS control plane. |
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of EKS Cluster |
| <a name="output_certificate_authority"></a> [certificate\_authority](#output\_certificate\_authority) | Attribute block containing certificate-authority-data of EKS cluster. |
| <a name="output_cluster_security_group"></a> [cluster\_security\_group](#output\_cluster\_security\_group) | Cluster Security Group created by EKS. |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Endpoint for EKS API Server. |
| <a name="output_id"></a> [id](#output\_id) | Name of EKS Cluster |
| <a name="output_kubernetes_version"></a> [kubernetes\_version](#output\_kubernetes\_version) | Kubernetes Version. |
| <a name="output_oidc"></a> [oidc](#output\_oidc) | Nested block containing URL for OpenID Connect Identity. |
| <a name="output_platform_version"></a> [platform\_version](#output\_platform\_version) | EKS Platform Version. |
