output "arn" {
  description = "ARN of OIDC Provider."
  value       = aws_iam_openid_connect_provider.this.arn
}

output "thumbprint" {
  description = "TLS Thumbprint retrieved from OIDC endpoint."
  value       = data.tls_certificate.this.certificates[0].sha1_fingerprint
}

output "certificates" {
  description = "Nested block of metadata for the TLS certificate"
  value       = data.tls_certificate.this.certificates
}
