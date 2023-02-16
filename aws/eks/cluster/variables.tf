variable "eks_cluster_name" {
  description = "The name of the EKS cluster to be created."
  type        = string
}
variable "eks_role_arn" {
  description = "The IAM Role ARN that provides permission for the EKS control plane."
  type        = string
}

variable "eks_version" {
  description = "The Kubernetes version of EKS cluster to be created."
  type        = string
}

variable "subnet_ids" {
  description = "The VPC Subnet IDs to associate with the EKS cluster."
}

variable "endpoint_private_access" {
  description = "Defines whether EKS private API server endpoint is enabled. Default = true."
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Defines whether EKS public API server endpoint is enabled. Default = true."
  type        = bool
  default     = true
}

variable "public_access_cidrs" {
  description = "List of CIDR to be permitted to access EKS public API endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "additional_security_group_ids" {
  description = "List of Security Group IDs for the EKS control plane."
  type        = list(string)
  default     = []
}

variable "enabled_cluster_log_types" {
  description = "List of desired control plane logging to enable."
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "tags" {
  description = "Key-value map of resource tags to be associated with the EKS cluster."
  type        = map(any)
  default     = {}
}
