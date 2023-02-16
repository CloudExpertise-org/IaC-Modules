# Conditionally creates IAM role for Node Group
resource "aws_iam_role" "this" {
  count = var.node_role_arn == null ? 1 : 0

  name = "${var.node_group_name}-nodegroup"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = local.assume_role_policy
  })

  permissions_boundary = var.permissions_boundary
}

# Conditionally create IAM role policy attachment
resource "aws_iam_role_policy_attachment" "this" {
  for_each = var.node_role_arn == null ? toset(var.policy_attachment_arns) : []

  role       = aws_iam_role.this[0].name
  policy_arn = each.key
}

resource "aws_eks_node_group" "this" {
  cluster_name = var.eks_cluster_name
  version      = var.eks_version

  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn == null ? aws_iam_role.this[0].arn : var.node_role_arn
  subnet_ids      = var.subnet_ids

  ami_type        = var.ami_type
  release_version = var.ami_release_version
  capacity_type   = var.capacity_type
  instance_types  = var.instance_types
  disk_size       = var.disk_size

  force_update_version = var.force_update_version

  scaling_config {
    desired_size = var.size_max
    max_size     = var.size_max
    min_size     = var.size_min
  }

  update_config {
    max_unavailable_percentage = var.max_unavailable_percentage
  }

  dynamic "taint" {
    for_each = var.taints
    content {
      key    = taint.value["key"]
      value  = taint.value["value"]
      effect = taint.value["effect"]
    }
  }

  labels = var.labels == {} ? null : var.labels

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  depends_on = [
    aws_iam_role_policy_attachment.this
  ]
}


locals {
  asg_labels_tags = [
    for label_key, label_value in var.labels : {
      key   = "k8s.io/cluster-autoscaler/node-template/label/${label_key}"
      value = label_value
    }
  ]
  # Unused for now, unable to not provision a taint tag for node groups without a taint tag.
  asg_taints_tags = [
    for taint in var.taints : {
      key   = "k8s.io/cluster-autoscaler/node-template/taint/${taint.key}"
      value = taint.effect
    }
  ]
  asg_tags = [
    for label_key, label_value in var.tags : {
      key   = label_key
      value = label_value
    }
  ]
  # Placeholder / Workaround for when no label is supplied.
  asg_labels_dummy = [{
    key   = "dummy-label-ignore"
    value = "empty-value-ignore"
  }]
  # Placeholder / Workaround for when no taint is supplied.
  asg_taints_dummy = [{
    key   = "dummy-taint-ignore"
    value = "empty-value-ignore"
  }]
  # Placeholder / Workaround for when no tag is supplied.
  asg_tags_dummy = [{
    key   = "dummy-tag-ignore"
    value = "empty-value-ignore"
  }]
  # Assume Role Policy for EKS Node Group
  assume_role_policy = [{
    Action = "sts:AssumeRole"
    Effect = "Allow"
    Sid    = "ec2"
    Principal = {
      Service = "ec2.amazonaws.com"
    }
  }]
}

# This is a bit hacky - I am assuming there is only 1 ASG ever being created by the aws_eks_node_group resource.
# I tried to create a for_each loop to iterate through the ASGs (if ever more than 1) but Terraform wasn't able to perform the plan until after the node group had been applie.
# Two stage applies are not great because it prevents IaC from being automatically deployed.
# So I have made an assumption that we will only ever support tagging the first ASG. Tough.
# The same applies to both label and taint tag below.
resource "aws_autoscaling_group_tag" "label" {
  autoscaling_group_name = aws_eks_node_group.this.resources[0].autoscaling_groups[0].name

  dynamic "tag" {
    # This particular resource aws_autoscaling_group_tag only supports managing a single individual tag.
    for_each = length(local.asg_labels_tags) == 0 ? [local.asg_labels_dummy[0]] : [local.asg_labels_tags[0]]
    content {
      key                 = tostring(tag.value["key"])
      value               = tostring(tag.value["value"])
      propagate_at_launch = false
    }
  }
}
# If no taints are supplied then a dummy taint will be applied.
# This resource could not be made conditional due to terraform limitation.
resource "aws_autoscaling_group_tag" "taint" {
  autoscaling_group_name = aws_eks_node_group.this.resources[0].autoscaling_groups[0].name

  dynamic "tag" {
    # This particular resource aws_autoscaling_group_tag only supports managing a single individual tag.
    for_each = length(local.asg_taints_tags) == 0 ? [local.asg_taints_dummy[0]] : [local.asg_taints_tags[0]]
    content {
      key                 = tostring(tag.value["key"])
      value               = tostring(tag.value["value"])
      propagate_at_launch = false
    }
  }
}

resource "aws_autoscaling_group_tag" "tags" {
  autoscaling_group_name = aws_eks_node_group.this.resources[0].autoscaling_groups[0].name

  dynamic "tag" {
    # This particular resource aws_autoscaling_group_tag only supports managing a single individual tag.
    for_each = length(local.asg_tags) == 0 ? [local.asg_tags_dummy[0]] : [local.asg_tags[0]]
    content {
      key                 = tostring(tag.value["key"])
      value               = tostring(tag.value["value"])
      propagate_at_launch = true
    }
  }
}
