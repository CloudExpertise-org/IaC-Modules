# Creates an EFS FileSystem
resource "aws_efs_file_system" "this" {
  encrypted                       = var.encrypted
  performance_mode                = var.performance_mode
  throughput_mode                 = var.provisioned_throughput == null ? "bursting" : "provisioned"
  provisioned_throughput_in_mibps = var.provisioned_throughput == null ? null : var.provisioned_throughput

  tags = {
    Name = var.name
  }

  # Dynamically create Lifecycle Policies for objects stored in EFS, transition objects to IA if not accessed for certain period of time.
  dynamic "lifecycle_policy" {
    for_each = var.lifecycle_enabled == true ? [1] : []
    content {
      transition_to_ia = var.transition_to_ia
    }
  }

  # Dynamically create Lifecycle Policies for objects stored in EFS, move back to Primary Storage Class upon access.
  dynamic "lifecycle_policy" {
    for_each = var.lifecycle_enabled == true ? [1] : []
    content {
      transition_to_primary_storage_class = var.transition_to_primary_storage_class
    }
  }
}

# Creates Backup Policy to backup EFS with AWS Backup
resource "aws_efs_backup_policy" "this" {
  file_system_id = aws_efs_file_system.this.id

  backup_policy {
    status = var.aws_backup_enabled == true ? "ENABLED" : "DISABLED"
  }
}

# Data source to fetch subnet information
data "aws_subnet" "this" {
  for_each = toset(var.subnets_list)

  id = each.key
}

# Creates a new Security Group for each unique VPC referenced as module input, to be associated with EFS Mount Points.
resource "aws_security_group" "this" {
  for_each = toset(distinct([for subnet in data.aws_subnet.this : subnet.vpc_id]))

  name        = "${var.name}-sg"
  description = "Allow NFS access to EFS ${var.name}."
  vpc_id      = each.key

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # Adds add CIDR ranges of subnets supplied in module input as ingress.
  # There isn't a good way of only adding those belonging to the same VPC so it adds them all.
  dynamic "ingress" {
    for_each = { for subnet in data.aws_subnet.this : subnet.id => subnet }
    content {
      description = "NFS for EFS, allows from ${ingress.value.id}"
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
      cidr_blocks = [ingress.value.cidr_block]
    }
  }
}

# Creates EFS Mount Target and attaches Security Group to corresponding Target.
resource "aws_efs_mount_target" "this" {
  for_each = { for subnet in data.aws_subnet.this : subnet.id => subnet }

  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = each.value.id
  security_groups = [aws_security_group.this[each.value.vpc_id].id]

}
