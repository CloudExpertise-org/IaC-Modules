# AWS Terraform `aws/eks/addons` module

This module enables EKS management of add-ons.

Currently the following add-ons can be add for EKS management:
> * kube_proxy
> * vpc_cni
> * coredns
> * ebs_csi
> * adot

Selectively enable EKS management of add-ons with the `managed_addons` variable.

```
module "eks-managed-addons" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/eks/addons?ref=v0.0.1"

  eks_cluster_name = module.eks-cluster.id
  managed_addons   = ["kube_proxy", "vpc_cni", "coredns"]
  irsa_vpc_cni_arn = module.eks-irsa-cni.iam_role_arn
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
| [aws_eks_addon.coredns](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/eks_addon) | resource |
| [aws_eks_addon.kube_proxy](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/eks_addon) | resource |
| [aws_eks_addon.vpc_cni](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/eks_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_coredns_version_map"></a> [coredns\_version\_map](#input\_coredns\_version\_map) | Mapping of EKS version to CoreDNS plugin version. | `map(any)` | <pre>{<br>  "1.19": "v1.8.0-eksbuild.1",<br>  "1.20": "v1.8.3-eksbuild.1",<br>  "1.21": "v1.8.4-eksbuild.1",<br>  "1.22": "v1.8.7-eksbuild.1"<br>}</pre> | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | Name of the EKS Cluster. | `string` | n/a | yes |
| <a name="input_irsa_vpc_cni_arn"></a> [irsa\_vpc\_cni\_arn](#input\_irsa\_vpc\_cni\_arn) | ARN of IAM Role for Service Account to be used with VPC CNI addon. | `string` | `""` | no |
| <a name="input_kube_proxy_version_map"></a> [kube\_proxy\_version\_map](#input\_kube\_proxy\_version\_map) | Mapping of EKS version to Kube Proxy plugin version. | `map(any)` | <pre>{<br>  "1.19": "v1.19.6-eksbuild.2",<br>  "1.20": "v1.20.4-eksbuild.2",<br>  "1.21": "v1.21.2-eksbuild.2",<br>  "1.22": "v1.22.6-eksbuild.1"<br>}</pre> | no |
| <a name="input_managed_addons"></a> [managed\_addons](#input\_managed\_addons) | List of addons to be managed by EKS. Valid options are: "coredns", "kube\_proxy" and "vpc\_cni" | `list(string)` | <pre>[<br>  "coredns",<br>  "kube_proxy",<br>  "vpc_cni"<br>]</pre> | no |
| <a name="input_vpc_cni_version_map"></a> [vpc\_cni\_version\_map](#input\_vpc\_cni\_version\_map) | Mapping of EKS version to VPC CNI plugin version. | `map(any)` | <pre>{<br>  "1.19": "v1.11.0-eksbuild.1",<br>  "1.20": "v1.11.0-eksbuild.1",<br>  "1.21": "v1.11.0-eksbuild.1",<br>  "1.22": "v1.11.0-eksbuild.1"<br>}</pre> | no |

## Outputs

No outputs.
