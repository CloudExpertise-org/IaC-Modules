output "arn" {
  description = "The ARN of EFS Filesystem."
  value       = aws_efs_file_system.this.arn
}

output "id" {
  description = "The ID of EFS Filesystem."
  value       = aws_efs_file_system.this.id
}

output "dns" {
  description = "The DNS Name of EFS Filesystem."
  value       = aws_efs_file_system.this.dns_name
}

output "security_groups" {
  description = "The Security Groups created for each VPC supplied."
  value = { for key, value in aws_security_group.this :
    key => value.id
  }
}

output "mount_targets_dns" {
  description = "The DNS Name of Mount Targets created."
  value = { for key, value in aws_efs_mount_target.this :
    key => value.dns_name
  }
}
