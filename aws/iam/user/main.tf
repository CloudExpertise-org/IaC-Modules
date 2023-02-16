# Create an IAM user
resource "aws_iam_user" "this" {
  name = var.iam_user_name

  permissions_boundary = var.permissions_boundary
}

# Attach supplied policies to IAM user
resource "aws_iam_user_policy_attachment" "this" {
  for_each = toset(var.policy_attachment_arns)

  user       = aws_iam_user.this.name
  policy_arn = each.key
}
