# defining local variables
locals {
  az_list = [
    for result in data.aws_subnet.this : result.availability_zone
  ]

  subnets_list       = sort(var.subnets_list)
  rds_suffix_hex     = random_id.rds_suffix[*].hex
  az_count           = length(local.az_list)
  az_override_length = length(var.az_list_override)
}

# random id - to append to resource names to avoid conflicts
resource "random_id" "suffix" {
  byte_length = 4
}

# random password - for RDS creation
resource "random_password" "rds" {
  length  = 32
  lower   = true
  upper   = true
  number  = true
  special = false
}

# storing the initial RDS password in AWS Secrets Manager
resource "aws_secretsmanager_secret" "rds" {
  name = "${var.environment}-${var.friendly_name}-${random_id.suffix.hex}"
}

# storing the initial RDS password in AWS Secrets Manager
resource "aws_secretsmanager_secret_version" "rds" {
  secret_id     = aws_secretsmanager_secret.rds.id
  secret_string = random_password.rds.result
}

# fetch Availability Zone information from subnets_list
data "aws_subnet" "this" {
  for_each = toset(local.subnets_list)

  id = each.value
}

# RDS DB Subnet Group
resource "aws_db_subnet_group" "this" {
  name       = "${var.environment}-${var.friendly_name}-${random_id.suffix.hex}"
  subnet_ids = local.subnets_list
}

# Defining RDS Cluster resource
resource "aws_rds_cluster" "this" {
  cluster_identifier                  = "${var.environment}-${var.friendly_name}-${random_id.suffix.hex}"
  engine                              = var.db_engine
  engine_version                      = var.db_engine_version
  availability_zones                  = local.az_list
  database_name                       = var.db_name_override == "" ? var.friendly_name : var.db_name_override
  master_username                     = var.master_username
  master_password                     = random_password.rds.result
  backup_retention_period             = var.backup_retention_period
  allow_major_version_upgrade         = var.allow_major_version_upgrade
  copy_tags_to_snapshot               = true
  db_subnet_group_name                = aws_db_subnet_group.this.id
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  storage_encrypted                   = var.storage_encrypted
  preferred_backup_window             = var.preferred_backup_window
  preferred_maintenance_window        = var.preferred_maintenance_window
  vpc_security_group_ids              = var.security_groups_list
  skip_final_snapshot                 = var.skip_final_snapshot
  final_snapshot_identifier           = var.final_snapshot_identifier == "" ? "${var.environment}-${var.friendly_name}-${random_id.suffix.hex}-final" : var.final_snapshot_identifier

  lifecycle {
    ignore_changes = [
      engine_version,
    ]
  }
}

# random id - to append to rds instances
resource "random_id" "rds_suffix" {
  count = var.db_instance_count

  byte_length = 2
}

# random az list
resource "random_shuffle" "az" {
  input = local.az_list
}

# Defining RDS Cluster Instance resource
resource "aws_rds_cluster_instance" "this" {
  count = var.db_instance_count

  cluster_identifier           = aws_rds_cluster.this.id
  identifier                   = "${var.environment}-${var.friendly_name}-${random_id.suffix.hex}-${local.rds_suffix_hex[count.index]}"
  instance_class               = var.db_instance_class
  engine                       = aws_rds_cluster.this.engine
  engine_version               = aws_rds_cluster.this.engine_version
  monitoring_interval          = 0
  availability_zone            = length(var.az_list_override) == 0 ? random_shuffle.az.result[count.index % local.az_count] : var.az_list_override[count.index % local.az_override_length]
  performance_insights_enabled = var.performance_insights_enabled
  copy_tags_to_snapshot        = true
}
