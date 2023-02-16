locals {
  tags = {
    IaC = "terraform"
  }
  merged_tags = merge(local.tags, var.tags)
}
