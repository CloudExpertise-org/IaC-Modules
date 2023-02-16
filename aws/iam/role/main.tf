# Building out elements for assume_role_policy
locals {
  assume_role_policy = [for service in var.assume_role_allowed_services :
    {
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = split(".", service)[0]
      Principal = {
        Service = service
      }
    }
  ]
}

# Creates an IAM role
resource "aws_iam_role" "this" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = local.assume_role_policy
  })

  permissions_boundary = var.permissions_boundary
}

# Attaches list of IAM Policies to role
resource "aws_iam_role_policy_attachment" "this" {
  for_each = toset(var.policy_attachment_arns)

  role       = aws_iam_role.this.name
  policy_arn = each.key
}

resource "aws_iam_instance_profile" "this" {
  count = contains(var.assume_role_allowed_services, "ec2.amazonaws.com") ? 1 : 0

  name = var.role_name
  role = aws_iam_role.this.name
}
