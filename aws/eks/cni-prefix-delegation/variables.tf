variable "eks_cluster_name" {
  description = "Name of the EKS Cluster."
  type        = string
}

variable "aws_cli_profile_name" {
  description = "The AWS profile name to be passed to the CLI via local-exec."
  type        = string
  default     = "default"
}
