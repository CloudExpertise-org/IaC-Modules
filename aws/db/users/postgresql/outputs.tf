
output "username" {
  description = "Name of new DB user."
  value       = postgresql_role.this.name
}

output "password_ssm_arn" {
  description = "AWS SSM where the password is stored."
  value       = aws_secretsmanager_secret.this.arn
}

output "database" {
  description = "Name of new DB for this user."
  value       = postgresql_database.this.name
}
