data "aws_eks_cluster" "this" {
  name = var.eks_cluster_name
}

# https://docs.aws.amazon.com/eks/latest/userguide/cni-increase-ip-addresses.html
resource "null_resource" "local_exec" {
  provisioner "local-exec" {
    command    = "aws --profile ${var.aws_cli_profile_name} eks update-kubeconfig --name ${var.eks_cluster_name} && kubectl set env daemonset aws-node -n kube-system ENABLE_PREFIX_DELEGATION=true && kubectl set env ds aws-node -n kube-system WARM_PREFIX_TARGET=1"
    on_failure = continue
  }
}
