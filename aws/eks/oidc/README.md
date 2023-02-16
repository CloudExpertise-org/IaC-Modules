# AWS Terraform `aws/eks/oidc` Module

This module provisions the Open ID Connector for EKS.

```
module "aws-eks-oidc" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/eks/oidc?ref=v0.0.1"

  oidc = module.eks-cluster.oidc
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.67.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 3.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.67.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/iam_openid_connect_provider) | resource |
| [tls_certificate.this](https://registry.terraform.io/providers/hashicorp/tls/3.3.0/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_oidc"></a> [oidc](#input\_oidc) | The OIDC URL of EKS cluster. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of OIDC Provider. |
| <a name="output_certificates"></a> [certificates](#output\_certificates) | Nested block of metadata for the TLS certificate |
| <a name="output_thumbprint"></a> [thumbprint](#output\_thumbprint) | TLS Thumbprint retrieved from OIDC endpoint. |
