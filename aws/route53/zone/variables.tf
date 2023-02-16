variable "fqdn" {
  description = "The Fully Qualified Domain Name of the Route 53 Zone."
  type        = string
}

variable "vpc_ids" {
  description = "A list of VPC IDs to associate this R53 zone with. If provided automatically makes the zone private."
  type        = list(string)
  default     = []
}
