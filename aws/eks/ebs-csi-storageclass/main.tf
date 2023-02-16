data "aws_eks_cluster" "this" {
  name = var.eks_cluster_name
}

# Add new gp3 storageclass to EKS cluster
resource "null_resource" "local_exec" {
  provisioner "local-exec" {
    command    = "aws --profile ${var.aws_cli_profile_name} eks update-kubeconfig --name ${var.eks_cluster_name} && kubectl apply -R -f ${path.module}/manifests/"
    on_failure = continue
  }
}

# Annotate Service Account for regional sts endpoint
resource "null_resource" "local_exec_regional_sts" {
  provisioner "local-exec" {
    command    = "kubectl annotate serviceaccount/ebs-csi-controller-sa eks.amazonaws.com/sts-regional-endpoints=true --namespace kube-system"
    on_failure = continue
  }

  depends_on = [
    null_resource.local_exec
  ]
}


# Make default storageclass non-default
resource "null_resource" "local_exec_storageclass_update" {
  count = var.make_default_storageclass == true ? 1 : 0

  provisioner "local-exec" {
    command    = "./${path.module}/scripts/storageclass.sh"
    on_failure = continue
  }

  depends_on = [
    null_resource.local_exec
  ]
}
