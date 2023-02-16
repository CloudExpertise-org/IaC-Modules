output "ami" {
  description = "The AMI selected."
  value       = data.aws_ami.this.id
}

output "launchtemplate_id" {
  description = "The ID of Launch Template created."
  value       = aws_launch_template.this.id
}

output "asg_id" {
  description = "The ID of Autoscaling Group created."
  value       = aws_autoscaling_group.this.id
}
