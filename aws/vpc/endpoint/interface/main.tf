data "aws_vpc" "this" {
  id = var.vpc_id
}

resource "aws_security_group" "this" {
  name        = "vpc_endpoint_interface_allow"
  description = "Allow traffic from VPC to VPC Endpoint Interfaces."
  vpc_id      = data.aws_vpc.this.id
}

resource "aws_security_group_rule" "this" {
  security_group_id = aws_security_group.this.id

  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "-1"
  cidr_blocks = [data.aws_vpc.this.cidr_block]
}

resource "aws_vpc_endpoint" "this" {
  for_each = toset(var.service_names)

  vpc_endpoint_type = "Interface"

  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.${var.aws_region}.${each.key}"

  security_group_ids  = [aws_security_group.this.id]
  subnet_ids          = var.subnet_ids
  private_dns_enabled = var.private_dns_enabled
}
