variable "name" {
  description = "Name of the S3 bucket. If not supplied Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "acl" {
  description = "The canned ACL to apply. Defaults to private."
  type        = string
  default     = "private"
}

variable "policy" {
  description = "The JSON document bucket policy to apply to bucket."
  type        = string
  default     = null
}

variable "versioning_enabled" {
  description = "Enables S3 bucket versioning."
  type        = bool
  default     = true
}

variable "lifecycle_enabled" {
  description = "Enable S3 lifecycle policy to limit the number of noncurrent objects."
  type        = bool
  default     = false
}

variable "lifecycle_id" {
  description = "The ID of S3 lifecycle policy."
  type        = string
  default     = null
}

variable "expired_object_delete_marker" {
  description = "Enable the deletion of expired delete markers."
  type        = bool
  default     = true
}

variable "noncurrent_version_expiration_days" {
  description = "The number of days for noncurrent_version_expiration."
  type        = number
  default     = 360
}

variable "abort_incomplete_multipart_upload_days" {
  description = "The number of days after initiating a multipart upload when the multipart upload must be completed."
  type        = number
  default     = 7
}
