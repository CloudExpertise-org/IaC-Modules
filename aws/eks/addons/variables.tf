variable "coredns_version_map" {
  description = "Mapping of EKS version to CoreDNS plugin version."
  type        = map(any)
  default = {
    "1.19" = "v1.8.0-eksbuild.1"
    "1.20" = "v1.8.3-eksbuild.1"
    "1.21" = "v1.8.4-eksbuild.1"
    "1.22" = "v1.8.7-eksbuild.1"
    "1.23" = "v1.8.7-eksbuild.2"
  }
}

variable "kube_proxy_version_map" {
  description = "Mapping of EKS version to Kube Proxy plugin version."
  type        = map(any)
  default = {
    "1.19" = "v1.19.6-eksbuild.2"
    "1.20" = "v1.20.4-eksbuild.2"
    "1.21" = "v1.21.2-eksbuild.2"
    "1.22" = "v1.22.11-eksbuild.2"
    "1.23" = "v1.22.11-minimal-eksbuild.2"
  }
}

variable "vpc_cni_version_map" {
  description = "Mapping of EKS version to VPC CNI plugin version."
  type        = map(any)
  default = {
    "1.19" = "v1.11.0-eksbuild.1"
    "1.20" = "v1.11.0-eksbuild.1"
    "1.21" = "v1.11.0-eksbuild.1"
    "1.22" = "v1.11.3-eksbuild.1"
    "1.23" = "v1.11.3-eksbuild.1"
  }
}

variable "ebs_csi_version_map" {
  description = "Mapping of EKS version to Amazon EBS CSI plugin version."
  type        = map(any)
  default = {
    "1.19" = "v1.10.0-eksbuild.1"
    "1.20" = "v1.10.0-eksbuild.1"
    "1.21" = "v1.10.0-eksbuild.1"
    "1.22" = "v1.10.0-eksbuild.1"
    "1.23" = "v1.10.0-eksbuild.1"
  }
}

variable "adot_version_map" {
  description = "Mapping of EKS version to ADOT plugin version."
  type        = map(any)
  default = {
    "1.19" = "v0.51.0-eksbuild.1"
    "1.20" = "v0.51.0-eksbuild.1"
    "1.21" = "v0.51.0-eksbuild.1"
    "1.22" = "v0.56.0-eksbuild.1"
    "1.23" = "v0.51.0-eksbuild.1"
  }
}

variable "eks_cluster_name" {
  description = "Name of the EKS Cluster."
  type        = string
}

variable "managed_addons" {
  description = "List of addons to be managed by EKS. Valid options are: \"coredns\", \"kube_proxy\" and \"vpc_cni\""
  type        = list(string)
  default     = ["coredns", "kube_proxy", "vpc_cni", "ebs_csi", "adot"]
}

variable "vpc_cni_irsa_arn" {
  description = "ARN of IAM Role for Service Account to be used with VPC CNI addon."
  type        = string
  default     = ""
}

variable "ebs_csi_irsa_arn" {
  description = "ARN of IAM Role for Service Account to be used with Amazon EBS CSI addon."
  type        = string
  default     = ""
}
