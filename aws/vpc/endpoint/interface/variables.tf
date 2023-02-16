variable "aws_region" {
  description = "The AWS region name, e.g., eu-west-1."
  type        = string
}

variable "vpc_id" {
  description = "The ID of VPC."
  type        = string
}

variable "service_names" {
  description = "A list of name of services to create VPC Endpoint for, e.g., ec2 or s3."
  type        = list(string)
}

variable "subnet_ids" {
  description = "A list of Subnet IDs to associate endpoint interfaces with."
  type        = list(string)
}

variable "private_dns_enabled" {
  description = "Whether or not to associate a private hosted zone with the specified VPC. Defaults to true."
  type        = bool
  default     = true
}
