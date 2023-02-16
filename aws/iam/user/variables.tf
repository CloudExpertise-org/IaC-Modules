variable "iam_user_name" {
  description = "The name of the IAM user to be created."
  type        = string
}

variable "policy_attachment_arns" {
  description = "List of IAM Policy ARNs to be attached to this IAM user."
  type        = list(string)
}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the user."
  default     = null
}
