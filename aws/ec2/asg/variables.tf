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

variable "name" {
  description = "Name of Launch Template and Autoscaling Group."
  type        = string
}

variable "name_override_lt" {
  description = "If provided, overrides generated name for Launch Template."
  type        = string
  default     = ""
}

variable "name_override_asg" {
  description = "If provided, overrides generated name for Autoscaling Group."
  type        = string
  default     = ""
}

variable "block_device_mappings" {
  description = "List of EBS device and size mapping, if supplied overrides values provided by AMI"
  type = list(object({
    device_name = string
    ebs = object({
      volume_type = string
      volume_size = number
    })
  }))
  default = []
}


variable "instance_type" {
  description = "The instance type name."
  type        = string
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile name assigned to the instance."
  type        = string
  default     = ""
}

variable "vpc_security_group_ids" {
  description = "A list of VPC Security Group IDs to be used."
  type        = list(string)
  default     = []
}

variable "user_data_base64" {
  description = "Base64-encoded user data to provide when launching the instance."
  type        = string
  default     = ""
}

variable "asg_size_max" {
  description = "The maximum size of Autoscaling Group. Must meet condition ( max >= desired >= min )."
  type        = number
  default     = 2
}

variable "asg_size_desired" {
  description = "The desired size of Autoscaling Group. Must meet condition ( max >= desired >= min )."
  type        = number
  default     = 2
}

variable "asg_size_min" {
  description = "The minimum size of Autoscaling Group. Must meet condition ( max >= desired >= min )."
  type        = number
  default     = 1
}

variable "asg_tags_list" {
  description = "A list of additional Key/Value pair of tags to be associated with the ASG."
  type = list(object({
    key                 = string
    value               = string
    propagate_at_launch = bool
  }))
  default = []
}

variable "subnet_ids_list" {
  description = "A list of subnet IDs for Autoscaling Group to launch instances in."
  type        = list(string)
}
