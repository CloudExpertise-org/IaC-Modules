output "scaledown_aws_autoscaling_schedule" {
  description = "The name of scaledown schedule"
  value       = var.scaledown_recurrence != "" ? aws_autoscaling_schedule.scaledown[0].id : null
}

output "scaleup_aws_autoscaling_schedule" {
  description = "The name of scaleup schedule"
  value       = var.scaleup_recurrence != "" ? aws_autoscaling_schedule.scaleup[0].id : null
}

output "scaleback_aws_autoscaling_schedule" {
  description = "The name of scaleback schedule"
  value       = var.scaleback_recurrence != "" ?  aws_autoscaling_schedule.scaleback[0].id : null
}
