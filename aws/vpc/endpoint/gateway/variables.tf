variable "aws_region" {
  description = "The AWS region name, e.g., eu-west-1."
  type        = string
}

variable "vpc_id" {
  description = "The ID of VPC."
  type        = string
}

variable "service_names" {
  description = "A list of name of services to create VPC Endpoint for, e.g., ec2 or dynamodb."
  type        = list(string)
}
