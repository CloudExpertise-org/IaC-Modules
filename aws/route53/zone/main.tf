resource "aws_route53_zone" "this" {
  name = var.fqdn

  dynamic "vpc" {
    for_each = var.vpc_ids
    content {
      vpc_id = vpc.value
    }
  }
}
