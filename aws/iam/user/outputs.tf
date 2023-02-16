output "arn" {
  description = "The ARN of IAM user created."
  value       = aws_iam_user.this.arn
}

output "iam_user_name" {
  description = "The name of IAM user created."
  value       = aws_iam_user.this.name
}

output "id" {
  description = "The unique ID of IAM user created."
  value       = aws_iam_user.this.unique_id
}
