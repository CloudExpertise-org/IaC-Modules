variable "ssm_document_name" {
  description = "Name of SSM Document to be associated with."
  type        = string
}

variable "ssm_document_version" {
  description = "The version of SSM Document to use."
  type        = string
  default     = null
}

variable "target_key" {
  description = "The Key to be used for this association."
  type        = string
}

variable "target_values_list" {
  description = "A list of values to be associated with."
  type        = list(string)
  default     = ["*"]
}

variable "apply_only_at_cron_interval" {
  description = "Determines if this assocication should be run immediately after association, defaults to false (don't apply till next cron time)."
  type        = bool
  default     = false
}

variable "cron" {
  description = "The cron expression for this association."
  type        = string
  default     = null
}

variable "max_concurrency" {
  description = "The max cocurrency of this association."
  type        = string
  default     = "50%"
}

variable "max_errors" {
  description = "The maximum number of errors allowed before stop sending requests to run association."
  type        = string
  default     = "50%"
}
