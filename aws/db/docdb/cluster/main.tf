# defining local variables
locals {
  az_list = [
    for result in data.aws_subnet.this : result.availability_zone
  ]

  subnets_list       = sort(var.subnets_list)
  db_suffix_hex      = random_id.db_suffix[*].hex
  az_count           = length(local.az_list)
  az_override_length = length(var.az_list_override)
}

# random id - to append to resource names to avoid conflicts
resource "random_id" "suffix" {
  byte_length = 4
}

# fetch Availability Zone information from subnets_list
data "aws_subnet" "this" {
  for_each = toset(local.subnets_list)

  id = each.value
}

# random password - for DocDB creation
resource "random_password" "docdb" {
  length  = 32
  lower   = true
  upper   = true
  number  = true
  special = false
}

# storing the initial RDS password in AWS Secrets Manager
resource "aws_secretsmanager_secret" "docdb" {
  name = "${var.environment}-${var.friendly_name}-${random_id.suffix.hex}"
}

# storing the initial RDS password in AWS Secrets Manager
resource "aws_secretsmanager_secret_version" "docdb" {
  secret_id     = aws_secretsmanager_secret.docdb.id
  secret_string = random_password.docdb.result
}

# Defining DocDB Subnet Group
resource "aws_docdb_subnet_group" "this" {
  name       = "${var.environment}-${var.friendly_name}-${random_id.suffix.hex}"
  subnet_ids = local.subnets_list
}

# Defining DocDB Cluster resource
resource "aws_docdb_cluster" "this" {
  db_subnet_group_name         = aws_docdb_subnet_group.this.name
  cluster_identifier           = "${var.environment}-${var.friendly_name}-${random_id.suffix.hex}"
  backup_retention_period      = var.backup_retention_period
  engine_version               = var.db_engine_version
  master_username              = "admin"
  master_password              = random_password.docdb.result
  storage_encrypted            = true
  preferred_backup_window      = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window
  vpc_security_group_ids       = var.security_groups_list
  skip_final_snapshot          = var.skip_final_snapshot
  final_snapshot_identifier    = var.final_snapshot_identifier == "" ? "${var.environment}-${var.friendly_name}-${random_id.suffix.hex}-final" : var.final_snapshot_identifier

  lifecycle {
    ignore_changes = [
      engine_version,
    ]
  }
}

# random id - to append to rds instances
resource "random_id" "db_suffix" {
  count = var.db_instance_count

  byte_length = 2
}

# random az list
resource "random_shuffle" "az" {
  input = local.az_list
}

# Defining DocDB Cluster Instances
resource "aws_docdb_cluster_instance" "this" {
  count = var.db_instance_count

  identifier                   = "${var.environment}-${var.friendly_name}-${random_id.suffix.hex}-${local.db_suffix_hex[count.index]}"
  cluster_identifier           = aws_docdb_cluster.this.id
  instance_class               = var.db_instance_class
  engine                       = aws_docdb_cluster.this.engine
  availability_zone            = length(var.az_list_override) == 0 ? random_shuffle.az.result[count.index % local.az_count] : var.az_list_override[count.index % local.az_override_length]
  preferred_maintenance_window = var.preferred_maintenance_window
}
