output "arn" {
  description = "The ARN of IAM role created."
  value       = aws_iam_role.this.arn
}

output "id" {
  description = "The name of the IAM role created."
  value       = aws_iam_role.this.id
}

output "name" {
  description = "The name of the IAM role created."
  value       = aws_iam_role.this.name
}

output "creation_date" {
  description = "The date this IAM role was created."
  value       = aws_iam_role.this.create_date
}

output "unique_id" {
  description = "The unique string identifying this IAM role."
  value       = aws_iam_role.this.unique_id
}

output "tags_all" {
  description = "A map of tags assigned to the resource."
  value       = aws_iam_role.this.tags_all
}

output "instance_profile_arn" {
  description = "The ARN of IAM Instance Profile."
  value       = contains(var.assume_role_allowed_services, "ec2.amazonaws.com") ? aws_iam_instance_profile.this[0].arn : null
}

output "instance_profile_id" {
  description = "The ID of IAM Instance Profile."
  value       = contains(var.assume_role_allowed_services, "ec2.amazonaws.com") ? aws_iam_instance_profile.this[0].id : null
}
