variable "name" {
  description = "Name of the SSM Document."
  type        = string
}

variable "document_format" {
  description = "Format of SSM content to be supplied, valid values are YAML or JSON."
  type        = string
  default     = "YAML"
}

variable "document_type" {
  description = "Type of SSM document to be created, defaults to Command."
  type        = string
  default     = "Command"
}

variable "document_content" {
  description = "The content of SSM document to be created."
  type        = string
  default     = null
}
