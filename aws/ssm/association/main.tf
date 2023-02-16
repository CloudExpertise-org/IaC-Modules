resource "aws_ssm_association" "this" {
  name             = var.ssm_document_name
  document_version = var.ssm_document_version

  targets {
    key    = var.target_key
    values = var.target_values_list
  }

  schedule_expression         = var.cron
  apply_only_at_cron_interval = var.apply_only_at_cron_interval

  max_concurrency = var.max_concurrency
  max_errors      = var.max_errors
}
