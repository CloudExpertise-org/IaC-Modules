variable "policy_name" {
  description = "The name of the IAM policy."
  type        = string
}

variable "policy_path" {
  description = "The path of the IAM policy."
  type        = string
  default     = "/"
}

variable "policy_description" {
  description = "The description of the IAM policy."
  type        = string
  default     = null
}

variable "policy_statements_json" {
  description = "A json string object containing the content of IAM policy. Used in place of policy_statements."
  type        = string
  default     = null
}

variable "policy_statements" {
  description = "A list of maps of statements of the IAM policy."
  type = list(object({
    sid       = string
    actions   = list(string)
    resources = list(string)
    effect    = string
  }))
  default = [{
    sid       = "null"
    actions   = ["null"]
    resources = ["*"]
    effect    = "Deny"
  }]
}
