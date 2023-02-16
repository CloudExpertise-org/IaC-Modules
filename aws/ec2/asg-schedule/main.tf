resource "random_id" "scaledown_recurrence" {
   keepers = {
    asg_scaledown_action_id = var.scaledown_recurrence
  }
  byte_length = 3
}


resource "random_id" "scaleup_recurrence" {
   keepers = {
    asg_scaleup_action_id = var.scaleup_recurrence
  }
  byte_length = 3
}

resource "random_id" "scaleback_recurrence" {
   keepers = {
    asg_scaleback_action_id = var.scaleback_recurrence
  }
  byte_length = 3
}

resource "aws_autoscaling_schedule" "scaledown" {
  count                  = var.scaledown_recurrence != "" ? 1 : 0
  scheduled_action_name  = var.scheduled_action_name == "" ? "${var.asg_name}-schedule-scaledown-${random_id.scaledown_recurrence.id}" : "${var.scheduled_action_name}-scaledown-${random_id.scaledown_recurrence.id}"
  autoscaling_group_name = var.asg_name
  min_size               = var.scaledown_desired_cap
  max_size               = var.asg_size_max
  desired_capacity       = var.scaledown_desired_cap
  recurrence             = var.scaledown_recurrence
  time_zone              = var.time_zone
#  start_time             = timeadd(timestamp(), "5m")
  lifecycle {
    ignore_changes = [start_time]
  }
}

resource "aws_autoscaling_schedule" "scaleup" {
  count                  = var.scaleup_recurrence != "" ? 1 : 0
  scheduled_action_name  = var.scheduled_action_name == "" ? "${var.asg_name}-schedule-scaleup-${random_id.scaleup_recurrence.id}" : "${var.scheduled_action_name}-scaleup-${random_id.scaleup_recurrence.id}"
  autoscaling_group_name = var.asg_name
  min_size               = var.asg_size_min
  max_size               = var.scaleup_desired_cap
  desired_capacity       = var.scaleup_desired_cap
  recurrence             = var.scaleup_recurrence
  time_zone              = var.time_zone
#  start_time             = timeadd(timestamp(), "5m")

  lifecycle {
    ignore_changes = [start_time]
  }
}

resource "aws_autoscaling_schedule" "scaleback" {
  count                  = var.scaleback_recurrence != "" ? 1 : 0
  scheduled_action_name  = var.scheduled_action_name == "" ? "${var.asg_name}-schedule-scaleback-${random_id.scaleback_recurrence.id}" : "${var.scheduled_action_name}-scaleback-${random_id.scaleback_recurrence.id}"
  autoscaling_group_name = var.asg_name
  min_size               = var.asg_size_min
  max_size               = var.asg_size_max
  desired_capacity       = var.asg_size_desired
  recurrence             = var.scaleback_recurrence
  time_zone              = var.time_zone
#  start_time             = timeadd(timestamp(), "5m")

  lifecycle {
    ignore_changes = [start_time]
  }
}