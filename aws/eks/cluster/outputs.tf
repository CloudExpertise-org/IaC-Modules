output "arn" {
  description = "ARN of EKS Cluster"
  value       = aws_eks_cluster.this.arn
}

output "id" {
  description = "Name of EKS Cluster"
  value       = aws_eks_cluster.this.id
}

output "certificate_authority" {
  description = "Attribute block containing certificate-authority-data of EKS cluster."
  value       = aws_eks_cluster.this.certificate_authority
}

output "endpoint" {
  description = "Endpoint for EKS API Server."
  value       = aws_eks_cluster.this.endpoint
}

output "kubernetes_version" {
  description = "Kubernetes Version."
  value       = aws_eks_cluster.this.version
}

output "platform_version" {
  description = "EKS Platform Version."
  value       = aws_eks_cluster.this.platform_version
}

output "oidc" {
  description = "Nested block containing URL for OpenID Connect Identity."
  value       = aws_eks_cluster.this.identity[0].oidc[0].issuer
}

output "cluster_security_group" {
  description = "Cluster Security Group created by EKS."
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}

output "additional_security_groups" {
  description = "List of additional Security Groups created for / assigned to EKS control plane."
  value       = concat([aws_security_group.cluster.id], var.additional_security_group_ids)
}
