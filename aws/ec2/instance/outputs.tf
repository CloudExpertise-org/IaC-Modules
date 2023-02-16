output "arn" {
  description = "The ARN of EC2 instance."
  value       = aws_instance.this.arn
}

output "ami" {
  description = "The AMI ID of EC2 instance."
  value       = aws_instance.this.ami
}
