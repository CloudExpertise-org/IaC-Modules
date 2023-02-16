output "fqdn" {
  description = "The FQDN of Route53 zone."
  value       = aws_route53_zone.this.name
}

output "name" {
  description = "The name of Route53 zone."
  value       = aws_route53_zone.this.name
}

output "vpc" {
  description = "The VPCs associated with this Route53 zone."
  value       = aws_route53_zone.this.vpc
}

output "arn" {
  description = "The ARN of Route53 zone."
  value       = aws_route53_zone.this.arn
}

output "id" {
  description = "The ID of Route53 zone."
  value       = aws_route53_zone.this.zone_id
}

output "nameservers" {
  description = "The ID of Route53 zone."
  value       = aws_route53_zone.this.name_servers
}
