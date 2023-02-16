locals {
  aws_account_id = split(":", var.eks_cluster_arn)[4]
}

data "aws_iam_policy_document" "trust_relationship" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${local.aws_account_id}:oidc-provider/${replace(var.eks_cluster_oidc, "https://", "")}"]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.eks_cluster_oidc, "https://", "")}:sub"
      values   = ["system:serviceaccount:${var.service_account_namespace}:${var.service_account_name}"]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.eks_cluster_oidc, "https://", "")}:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  name        = var.iam_role_name
  description = var.iam_role_description
  path        = var.iam_role_path

  assume_role_policy   = data.aws_iam_policy_document.trust_relationship.json
  permissions_boundary = var.iam_permissions_boundary
}

resource "aws_iam_role_policy_attachment" "this" {
  count = length(var.iam_policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = var.iam_policy_arns[count.index]
}
