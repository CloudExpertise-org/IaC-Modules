output "id" {
  description = "The ID of the Route 53 Resolver endpoint."
  value       = aws_route53_resolver_endpoint.this.id
}

output "arn" {
  description = "The ARN of the Route 53 Resolver endpoint."
  value       = aws_route53_resolver_endpoint.this.arn
}

output "security_group_ids" {
  description = "A list of Security Group IDs associated with the Route 53 Resolver endpoint."
  value       = aws_route53_resolver_endpoint.this.security_group_ids
}

output "ip_list" {
  description = "A list of IP addresses associated with this Route 53 Resolver."
  value       = [for item in aws_route53_resolver_endpoint.this.ip_address : item.ip]
}
