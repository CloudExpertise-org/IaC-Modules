variable "environment" {
  type        = string
  default     = "aws"
  description = "The environment name this module is deployed into. Default = aws"
}

variable "friendly_name" {
  type        = string
  description = "The name of this project, used for resource naming."
}

variable "subnets_list" {
  type        = list(string)
  description = "A list of VPC Subnets to be associated with the resources."
}

variable "backup_retention_period" {
  type        = number
  default     = 35
  description = "The number of days to retain DB backups. Default = 35"
}

variable "db_engine_version" {
  type        = string
  default     = "4.0.0"
  description = "The DocDB Engine Version. Default = 4.0.0"
}

variable "db_instance_class" {
  type        = string
  default     = "db.r5.medium"
  description = "The Instance Class of databases to be launched."
}

variable "db_instance_count" {
  type        = number
  default     = 2
  description = "The number of DocDB Instances to be created in the cluster. If number of instances requested < number of subnets specified, the instances will be placed in subnets selected by alphanumeric order."
}

variable "az_list_override" {
  type        = list(string)
  default     = []
  description = "An optional ordered list of Availability Zones to launch DobDB Cluster Instance(s) in, when provided will override random placement of instances."
}

variable "preferred_backup_window" {
  type        = string
  default     = "21:00-22:00"
  description = "Preferred backup window. Default = 21:00-22:00"
}

variable "preferred_maintenance_window" {
  type        = string
  default     = "Sat:10:00-Sat:11:30"
  description = "Preferred maintenance window. Default = Sat:10:00-Sat:11:30"
}

variable "security_groups_list" {
  type        = list(string)
  description = "List of Security Groups to be associated with the resource."
}

variable "skip_final_snapshot" {
  type        = bool
  default     = false
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted. Default = false"
}

variable "final_snapshot_identifier" {
  type        = string
  default     = ""
  description = " The name of your final DB snapshot when this DB cluster is deleted."
}
