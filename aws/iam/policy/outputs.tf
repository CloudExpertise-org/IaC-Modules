output "policy" {
  description = "The policy document of the policy."
  value       = aws_iam_policy.this.policy
}

output "id" {
  description = "The ID of this policy."
  value       = aws_iam_policy.this.policy_id
}

output "arn" {
  description = "The ARN of this policy."
  value       = aws_iam_policy.this.arn
}

output "path" {
  description = "The path of this policy."
  value       = aws_iam_policy.this.path
}
