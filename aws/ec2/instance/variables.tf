variable "ami_filters" {
  description = "List of map of key/value pair used to match the source AMI."
  type = list(object({
    name   = string
    values = list(string)
  }))
}

variable "ami_owners" {
  description = "List of owners of AMI."
  type        = list(string)
}

variable "instance_type" {
  description = "The instance type name."
  type        = string
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile assigned to the instance."
  type        = string
}

variable "subnet_id" {
  description = "The Subnet ID to launch the EC2 instance in."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of VPC Security Group IDs to be associated with the instance."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Key/Value pair of tags to be associated with the EC2 instance."
  type        = map(any)
  default     = {}
}