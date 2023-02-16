variable "environment" {
  type        = string
  default     = "aws"
  description = "The environment name this module is deployed into. Default = aws"
}

variable "db_host" {
  description = "Access endpoint of Database."
  type        = string
}

variable "db_port" {
  description = "Access port of Database."
  type        = string
}

variable "db_database_name" {
  description = "PostgreSQL database name to access."
  type        = string
}

variable "db_username" {
  description = "Username to authenticate to Database."
  type        = string
}

variable "db_password_ssm_arn" {
  description = "AWS SSM ARN that contains password to authenticate to Database."
  type        = string
}

variable "db_superuser" {
  description = "Defines whether user is superuser."
  type        = bool
  default     = false
}

variable "db_sslmode" {
  description = "DB SSL Mode."
  type        = string
  default     = "require"
}

variable "db_connect_timeout" {
  description = "DB Connect Timeout."
  type        = number
  default     = 15
}

variable "new_user_roles_list" {
  description = "List of roles to be granted to this new user."
  type        = list(string)
  default     = null
}

variable "new_user_name" {
  description = "Name of new user to be created. Also default as the name of new Database to be created for user."
  type        = string
}

variable "new_user_db_name" {
  description = "Name of new Database to be created for new user. Optional, if supplied overrides default new DB name."
  type        = string
  default     = null
}

variable "new_user_db_template" {
  description = "Template to create new DB for user."
  type        = string
  default     = null
}

variable "new_user_db_lc_collate" {
  description = "lc_collate of new DB for user."
  type        = string
  default     = null
}

variable "new_user_db_connection_limit" {
  description = "Connection limit of new DB for user."
  type        = number
  default     = null
}

variable "new_user_db_allow_connections" {
  description = "Allow connections for new DB for user."
  type        = bool
  default     = true
}
