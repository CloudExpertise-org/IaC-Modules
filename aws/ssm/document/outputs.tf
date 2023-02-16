output "name" {
  description = "The name of SSM document created."
  value       = aws_ssm_document.this.name
}

output "version_default" {
  description = "The default version of this document."
  value       = aws_ssm_document.this.default_version
}

output "version_latest" {
  description = "The latest version of this document."
  value       = aws_ssm_document.this.latest_version
}
