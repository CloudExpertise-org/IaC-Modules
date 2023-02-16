output "aws_sns_topic_arn" {
  value       = aws_sns_topic.this.arn
  description = "The ARN of SNS Topic created."
}

output "aws_sns_topic_name" {
  value       = aws_sns_topic.this.name
  description = "The Name of SNS Topic created."
}

output "aws_sns_topic_subscription_list" {
  value = [
    for k, v in aws_sns_topic_subscription.this : {
      id      = k
      arn     = v.arn
      pending = v.pending_confirmation
    }
  ]
}

output "aws_cloudwatch_log_metric_filter_id" {
  value       = aws_cloudwatch_log_metric_filter.this.id
  description = "The ID of CloudWatch Log Metric Filter created."
}

output "aws_cloudwatch_metric_alarm_arn" {
  value       = aws_cloudwatch_metric_alarm.this.arn
  description = "The ARN of CloudWatch Metric Alarm created."
}

output "aws_cloudwatch_metric_alarm_id" {
  value       = aws_cloudwatch_metric_alarm.this.id
  description = "The ID of CloudWatch Metric Alarm created."
}
