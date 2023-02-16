output "secrets_arn" {
  value = aws_secretsmanager_secret.rds.arn
}

output "aws_db_subnet_group_id" {
  value = aws_db_subnet_group.this.id
}

output "aws_db_subnet_group_arn" {
  value = aws_db_subnet_group.this.arn
}

output "aws_rds_cluster_id" {
  value = aws_rds_cluster.this.id
}

output "aws_rds_cluster_arn" {
  value = aws_rds_cluster.this.arn
}

output "aws_rds_cluster_identifier" {
  value = aws_rds_cluster.this.cluster_identifier
}

output "aws_rds_cluster_resource_id" {
  value = aws_rds_cluster.this.cluster_resource_id
}

output "aws_rds_cluster_endpoint" {
  value = aws_rds_cluster.this.endpoint
}

output "aws_rds_cluster_reader_endpoint" {
  value = aws_rds_cluster.this.reader_endpoint
}

output "aws_rds_cluster_engine" {
  value = aws_rds_cluster.this.engine
}

output "aws_rds_cluster_database_name" {
  value = aws_rds_cluster.this.database_name
}

output "aws_rds_cluster_port" {
  value = aws_rds_cluster.this.port
}

output "aws_rds_cluster_master_username" {
  value = aws_rds_cluster.this.master_username
}
