locals {
  metric_transformation_namespace = element(split("/", var.log_group_name), length(split("/", var.log_group_name)) - 1)
}

# random id - to append to resource names to avoid conflicts
resource "random_id" "suffix" {
  byte_length = 4
}

# Defining data sources
data "aws_cloudwatch_log_group" "this" {
  name = var.log_group_name
}

# Defining SNS Topic resource
resource "aws_sns_topic" "this" {
  name = "${var.environment}-${var.friendly_name}-${var.alarm_name}-${random_id.suffix.hex}"
}

# Defining SNS Topic subscriptions
resource "aws_sns_topic_subscription" "this" {
  for_each = toset(var.subscription_emails_list)

  topic_arn = aws_sns_topic.this.arn
  protocol  = "email"
  endpoint  = each.key
}

# Defining CloudWatch Logs Metric Filter
resource "aws_cloudwatch_log_metric_filter" "this" {
  log_group_name = data.aws_cloudwatch_log_group.this.name
  name           = "${var.environment}-${var.friendly_name}-${var.alarm_name}-${random_id.suffix.hex}"
  pattern        = var.filter_pattern

  metric_transformation {
    default_value = var.metric_transformation_default_value
    name          = "${var.environment}-${var.friendly_name}-${var.alarm_name}-${random_id.suffix.hex}"
    namespace     = local.metric_transformation_namespace
    value         = var.metric_transformation_value
  }

  # Note: CloudWatch namespace should not be considered as a form of access control, as IAM does not currently support conditional access based on CloudWatch namespace.
  # See README.md for further information.
}

# Defining CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "this" {
  actions_enabled           = true
  alarm_actions             = concat([aws_sns_topic.this.arn], var.cw_alarm_additional_actions)
  alarm_description         = var.cw_alarm_description
  alarm_name                = "${var.environment}-${var.friendly_name}-${var.alarm_name}-${random_id.suffix.hex}"
  comparison_operator       = var.cw_alarm_comparison_operator
  datapoints_to_alarm       = var.cw_alarm_datapoints_to_alarm
  evaluation_periods        = var.cw_alarm_evaluation_periods
  insufficient_data_actions = var.cw_alarm_insufficient_data_actions
  metric_name               = "${var.environment}-${var.friendly_name}-${var.alarm_name}-${random_id.suffix.hex}"
  namespace                 = local.metric_transformation_namespace
  ok_actions                = concat([aws_sns_topic.this.arn], var.cw_alarm_additional_actions)
  period                    = var.cw_alarm_period
  statistic                 = var.cw_alarm_statistic
  threshold                 = var.cw_alarm_threshold
  treat_missing_data        = var.cw_alarm_treat_missing_data
}
