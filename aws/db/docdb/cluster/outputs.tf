output "secrets_arn" {
  value = aws_secretsmanager_secret.docdb.arn
}

output "aws_docdb_subnet_group_id" {
  value = aws_docdb_subnet_group.this.id
}

output "aws_docdb_subnet_group_arn" {
  value = aws_docdb_subnet_group.this.arn
}

output "aws_docdb_cluster_id" {
  value = aws_docdb_cluster.this.id
}

output "aws_docdb_cluster_arn" {
  value = aws_docdb_cluster.this.arn
}

output "aws_docdb_cluster_cluster_resource_id" {
  value = aws_docdb_cluster.this.cluster_resource_id
}

output "aws_docdb_cluster_endpoint" {
  value = aws_docdb_cluster.this.endpoint
}

output "aws_docdb_cluster_reader_endpoint" {
  value = aws_docdb_cluster.this.reader_endpoint
}
