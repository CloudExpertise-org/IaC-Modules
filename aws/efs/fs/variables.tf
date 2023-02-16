variable "name" {
  description = "The name of the EFS Filesystem."
  type        = string
}

variable "encrypted" {
  description = "Determines whether the EFS is encrypted at rest, defaults to true."
  type        = bool
  default     = true
}

variable "performance_mode" {
  description = "Performance mode of EFS, defaults to generalPurpose."
  type        = string
  default     = "generalPurpose"
}

variable "provisioned_throughput" {
  description = "If specified, the throughput in MiB/s to provision for the filesystem. Defaults to null, which provisions the EFS in bursting mode."
  type        = string
  default     = null
}

variable "lifecycle_enabled" {
  description = "Enables EFS object lifecycle policy, defaults to true."
  type        = bool
  default     = true
}

variable "transition_to_ia" {
  description = "Lifecycle rule to transition files to IA storage class. Valid values: AFTER_{7,14,30,60,90}_DAYS. Defaults to AFTER_30_DAYS."
  type        = string
  default     = "AFTER_30_DAYS"
}

variable "transition_to_primary_storage_class" {
  description = "Lifecycle policy to transition files from IA to primary storage. Valid values: AFTER_1_ACCESS. Defaults to AFTER_1_ACCESS."
  type        = string
  default     = "AFTER_1_ACCESS"
}

variable "aws_backup_enabled" {
  description = "Enable Automatic AWS Backup on this EFS Filesystem."
  type        = bool
  default     = true
}

variable "subnets_list" {
  description = "A list of subnets to create EFS Mount Targets for."
  type        = list(string)
}
