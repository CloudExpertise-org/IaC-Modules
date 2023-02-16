variable "assume_role_allowed_services" {
  description = "List of services allowed to assume this role, i.e., [\"ec2.amazonaws.com\", \"eks.amazonaws.com\"]."
  type        = list(string)
}

variable "role_name" {
  description = "Name of the IAM role to be created."
  type        = string
}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
}

variable "policy_attachment_arns" {
  description = "List of IAM Policy ARNs to be attached to this role."
  type        = list(string)
}
