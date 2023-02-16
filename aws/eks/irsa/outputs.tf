output "iam_role_arn" {
  value       = aws_iam_role.this.arn
  description = "The ARN of IAM Role."
}

output "iam_role_create_date" {
  value       = aws_iam_role.this.create_date
  description = "The creation date of IAM Role."
}

output "iam_role_id" {
  value       = aws_iam_role.this.id
  description = "The Name of IAM Role."
}

output "iam_role_name" {
  value       = aws_iam_role.this.name
  description = "The Name of IAM Role."
}

output "iam_role_unique_id" {
  value       = aws_iam_role.this.unique_id
  description = "The unique ID of IAM Role."
}
