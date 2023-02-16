# AWS Terraform `aws/eks/irsa` Module

## Usage

```
module "eks-irsa-cni" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/eks-irsa?ref=v0.0.1"

  eks_cluster_arn  = aws_eks_cluster.eks.arn
  eks_cluster_oidc = aws_eks_cluster.eks.identity[0].oidc[0].issuer

  service_account_namespace = "kube-system"
  service_account_name      = "aws-node"

  iam_role_name            = "${var.environment_name}-EKSCNI"
  iam_role_description     = "IRSA for EKS CNI Plugin (aws-node)"
  iam_permissions_boundary = var.iam_permissions_boundary
  iam_policy_arns          = ["arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"]
}
```

## Required Input Variables

The Input Variables listed below should always be specified when calling this module as source.

| Variable | Type | Description | Default Value |
| -------- | ---- | ----------- | ------------- |
| eks_cluster_arn | string | The EKS Cluster ARN to be added to Trust Relationship of IAM role. |  |
| eks_cluster_oidc | string | The OpenID Connect provider URL, e.g., "aws_eks_cluster.eks.identity[0].oidc[0].issuer" |  |
| service_account_namespace | string |The namespace of Service Account to be added to Trust Relationship. |  |
| service_account_name | string |The name of Service Account to be added to Trust Relationship. |  |
| iam_role_name | string | The name of the IAM role to be created for EKS Service Account. |  |
| iam_permissions_boundary" | string | The ARN of IAM Policy to be used as Permissions Boundary of the IAM role. |  |
| iam_policy_arns | list(string) | The list of IAM Policy ARNs to be attached to this IAM role. | [] |


## Optional Input Variables

Lorem Ipsum

## Note
