locals {
  sg_rules = [
    {
      sid         = "in_tcp_53"
      type        = "ingress"
      protocol    = "tcp"
      from_port   = 53
      to_port     = 53
      cidr_blocks = var.ingress_cidrs
    },
    {
      sid         = "in_udp_53"
      type        = "ingress"
      protocol    = "udp"
      from_port   = 53
      to_port     = 53
      cidr_blocks = var.ingress_cidrs
    },
    {
      sid         = "out_all"
      type        = "egress"
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]
}
