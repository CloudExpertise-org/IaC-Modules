data "aws_eks_cluster" "this" {
  name = var.eks_cluster_name
}

resource "aws_eks_addon" "coredns" {
  count = contains(var.managed_addons, "coredns") ? 1 : 0

  cluster_name = var.eks_cluster_name

  addon_name        = "coredns"
  addon_version     = var.coredns_version_map[data.aws_eks_cluster.this.version]
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "kube_proxy" {
  count = contains(var.managed_addons, "kube_proxy") ? 1 : 0

  cluster_name = var.eks_cluster_name

  addon_name        = "kube-proxy"
  addon_version     = var.kube_proxy_version_map[data.aws_eks_cluster.this.version]
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "vpc_cni" {
  count = contains(var.managed_addons, "vpc_cni") ? 1 : 0

  cluster_name = var.eks_cluster_name

  addon_name               = "vpc-cni"
  addon_version            = var.vpc_cni_version_map[data.aws_eks_cluster.this.version]
  resolve_conflicts        = "OVERWRITE"
  service_account_role_arn = var.vpc_cni_irsa_arn == "" ? null : var.vpc_cni_irsa_arn
}

resource "aws_eks_addon" "ebs_csi" {
  count = contains(var.managed_addons, "ebs_csi") ? 1 : 0

  cluster_name = var.eks_cluster_name

  addon_name               = "aws-ebs-csi-driver"
  addon_version            = var.ebs_csi_version_map[data.aws_eks_cluster.this.version]
  resolve_conflicts        = "OVERWRITE"
  service_account_role_arn = var.ebs_csi_irsa_arn == "" ? null : var.ebs_csi_irsa_arn
}

resource "aws_eks_addon" "adot" {
  count = contains(var.managed_addons, "adot") ? 1 : 0

  cluster_name = var.eks_cluster_name

  addon_name        = "adot"
  addon_version     = var.adot_version_map[data.aws_eks_cluster.this.version]
  resolve_conflicts = "OVERWRITE"
}
