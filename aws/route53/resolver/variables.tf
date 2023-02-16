variable "vpc_id" {
  description = "The VPC ID this Resolver is associated with."
  type        = string
}

variable "name" {
  description = "The name of Resolver."
  type        = string
}

variable "direction" {
  description = "The direction of this Resolver, INBOUND or OUTBOUND"
  type        = string
  default     = "INBOUND"
}

variable "subnet_ids" {
  description = "List of Subnet IDs to be associated with this Resolver."
  type        = list(string)
}

variable "hostnum" {
  description = "The number of host passed to cidrhost() function to calculate IP used by Resolver ENI."
  type        = number
  default     = 53 #doesn't need to be 53 but DNS and why not
}

variable "ingress_cidrs" {
  description = "List of CIDRs permitted to access this Resolver ENI over TCP and UDP port 53."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
