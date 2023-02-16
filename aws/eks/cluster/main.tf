# Identify the VPC ID of var.subnet_ids[0]
data "aws_subnet" "this" {
  id = var.subnet_ids[0]
}

# Cluster Security Group
# https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html
resource "aws_security_group" "cluster" {
  name        = "${var.eks_cluster_name}-cluster-sg"
  description = "EKS additional security group for ${var.eks_cluster_name}"
  vpc_id      = data.aws_subnet.this.vpc_id

  tags = local.merged_tags
}

# Allow outbound to 0.0.0.0/0 and ::/0 as per AWS recommendation
resource "aws_security_group_rule" "outbound" {
  security_group_id = aws_security_group.cluster.id

  type             = "egress"
  from_port        = 0
  to_port          = 0
  protocol         = "all"
  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
}

# Allow all inbound from self as per AWS recommendation
resource "aws_security_group_rule" "inbound" {
  security_group_id = aws_security_group.cluster.id

  type      = "ingress"
  from_port = 0
  to_port   = 0
  protocol  = "all"
  self      = true
}

# Provisioning the EKS cluster
resource "aws_eks_cluster" "this" {
  name     = var.eks_cluster_name
  role_arn = var.eks_role_arn
  version  = var.eks_version

  vpc_config {
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    public_access_cidrs     = var.public_access_cidrs
    security_group_ids      = concat([aws_security_group.cluster.id], var.additional_security_group_ids)
    subnet_ids              = var.subnet_ids
  }

  enabled_cluster_log_types = var.enabled_cluster_log_types == [] ? null : var.enabled_cluster_log_types

  tags = local.merged_tags
}
