# AWS Terraform `aws/eks/cli-prefix-delegation` module

Enables prefix-delegation feature of aws-cni plugin.  

Requires awscli to be installed and available.

```
module "eks-cli-prefix-delegation" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/eks/cni-prefix-delegation?ref=v0.0.1"

  eks_cluster_name      = module.eks-cluster.id
  aws_cli_profile_name  = var.aws_cli_profile_name
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.67.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.67.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.prefix_delegation](https://registry.terraform.io/providers/hashicorp/null/3.0.0/docs/resources/resource) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/eks_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_cli_profile_name"></a> [aws\_cli\_profile\_name](#input\_aws\_cli\_profile\_name) | The AWS profile name to be passed to the CLI via local-exec. | `string` | `"default"` | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | Name of the EKS Cluster. | `string` | n/a | yes |

## Outputs

No outputs.
