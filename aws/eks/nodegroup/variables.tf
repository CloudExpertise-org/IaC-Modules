variable "eks_cluster_name" {
  description = "Name of EKS Cluster."
  type        = string
}

variable "eks_version" {
  description = "Version of EKS Cluster."
  type        = string
}

variable "node_group_name" {
  description = "Name of EKS Node Group."
  type        = string
}

variable "node_role_arn" {
  description = "IAM Role ARN to be assigned to the Node Group. If unspecified a new IAM Role is created."
  type        = string
  default     = null
}

variable "assume_role_allowed_services" {
  description = "List of services allowed to assume this role, i.e., [\"ec2.amazonaws.com\"]."
  type        = list(string)
  default     = ["ec2.amazonaws.com"]
}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
  type        = string
  default     = null
}

variable "policy_attachment_arns" {
  description = "List of IAM Policy ARNs to be attached to this role."
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}

variable "subnet_ids" {
  description = "List of VPC Subnet IDs to be associated with this Node Group."
  type        = list(string)
}

variable "ami_type" {
  description = "The type of AMI to be used. Default = AL2_x86_64"
  type        = string
  default     = "AL2_x86_64"
}

variable "ami_release_version" {
  description = "The AMI version of the EKS Node Group."
  type        = string
  default     = null
}

variable "capacity_type" {
  description = "Type of capacity associated with EKS node group."
  type        = string
  default     = "ON_DEMAND"
}

variable "instance_types" {
  description = "List of instance types associated with the ELS node group."
  type        = list(string)
  default     = ["m6i.large"]
}

variable "disk_size" {
  description = "Disk size in GiB for nodes."
  type        = string
  default     = 20
}

variable "force_update_version" {
  description = "Force version update if existing pods are unable to be drained due to a pod disruption budget issue."
  type        = bool
  default     = true
}

variable "size_max" {
  description = "Maximum size of ASG. (Also used to set Desired Size at creation.)"
  type        = string
}

variable "size_min" {
  description = "Minimum size of ASG."
  type        = string
}

variable "max_unavailable_percentage" {
  description = "Maximum unavailable percentage of the nodes during a version update."
  type        = string
  default     = 25
}

variable "taints" {
  description = "List of taints to be added to the Node Group."
  type = list(object({
    key    = string
    value  = string
    effect = string
  }))
  default = []
}

variable "labels" {
  description = "Map of Kubernetes labels to be added to the Node Group."
  type        = map(any)
  default     = {}
}

variable "tags" {
  description = "Map of AWS Tags to be added to the Auto Scaling Group created by EKS Node Group."
  type        = map(any)
  default     = {}
}
