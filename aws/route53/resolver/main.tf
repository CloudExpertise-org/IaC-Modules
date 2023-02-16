# Fetch metadata for incoming list of subnets, will be used to calculate resolver ip addresses to use
data "aws_subnet" "this" {
  for_each = toset(var.subnet_ids)
  id       = each.key
}

# Create a Security Group to be associated with resolver ENI.
resource "aws_security_group" "this" {
  name        = "route53-resolver-${var.name}-${lower(var.direction)}"
  description = "Allow DNS traffic to reach Resolver ENI."
  vpc_id      = var.vpc_id
}

# Create Security Group rules, looping through local.sg_rules for configuration.
resource "aws_security_group_rule" "this" {
  for_each = { for rule in local.sg_rules : rule.sid => rule }

  security_group_id = aws_security_group.this.id

  type        = each.value["type"]
  protocol    = each.value["protocol"]
  from_port   = each.value["from_port"]
  to_port     = each.value["to_port"]
  cidr_blocks = each.value["cidr_blocks"]
}

# Creates the Route 53 resolver endpoint, for each subnet provided uses cidrhost() function to calculate IP address to use.
resource "aws_route53_resolver_endpoint" "this" {
  name      = var.name
  direction = var.direction

  security_group_ids = [
    aws_security_group.this.id
  ]

  dynamic "ip_address" {
    for_each = toset(var.subnet_ids)
    content {
      subnet_id = ip_address.value
      ip        = cidrhost(data.aws_subnet.this[ip_address.value].cidr_block, var.hostnum)
    }
  }
}
