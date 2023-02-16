variable "iam_role_name" {
  type        = string
  description = "The name of the IAM role to be created for EKS Service Account."
}

variable "iam_role_description" {
  type        = string
  default     = ""
  description = "The description of the IAM role to be created for EKS Service Account."
}

variable "iam_role_path" {
  type        = string
  default     = "/"
  description = "The path of the IAM role to be created for EKS Service Account."
}

variable "iam_policy_arns" {
  type        = list(string)
  default     = []
  description = "The list of IAM Policy ARNs to be attached to this IAM role."
}

variable "iam_permissions_boundary" {
  type        = string
  default     = ""
  description = "The ARN of IAM Policy to be used as Permissions Boundary of the IAM role."
}

variable "eks_cluster_arn" {
  type        = string
  description = "The ARN of EKS Cluster to be added to Trust Policy."
}

variable "eks_cluster_oidc" {
  type        = string
  description = "The OpenID Connect provider URL, e.g., \"aws_eks_cluster.eks.identity[0].oidc[0].issuer\""
}

variable "service_account_namespace" {
  type        = string
  description = "The namespace of Service Account to be added to Trust Relationship."
}

variable "service_account_name" {
  type        = string
  description = "The name of Service Account to be added to Trust Relationship."
}
