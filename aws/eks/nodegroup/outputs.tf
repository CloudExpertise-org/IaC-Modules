output "arn" {
  description = "ARN of Node Group created."
  value       = aws_eks_node_group.this.arn
}

output "id" {
  description = "EKS Cluster name and EKS Node Group name separated by a colon."
  value       = aws_eks_node_group.this.id
}

output "resources" {
  description = "List of objects containing information about underlying resources."
  value       = aws_eks_node_group.this.resources
}

output "asg_name" {
  description = "List of Autoscaling Groups."
  value       = aws_eks_node_group.this.resources[*].autoscaling_groups[*].name
}

output "node_role_arn" {
  description = "The ARN of IAM role used for launching Node Group."
  value       = aws_eks_node_group.this.node_role_arn
}
