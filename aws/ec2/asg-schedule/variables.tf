variable "asg_name" {
  description = "Name of Launch Template and Autoscaling Group."
  type        = string
}

variable "asg_size_max" {
  description = "The maximum size of Autoscaling Group. Must meet condition ( max >= desired >= min )."
  type        = number
  default     = 2
}

variable "asg_size_desired" {
  description = "The desired size of Autoscaling Group. Must meet condition ( max >= desired >= min )."
  type        = number
  default     = 2
}

variable "asg_size_min" {
  description = "The minimum size of Autoscaling Group. Must meet condition ( max >= desired >= min )."
  type        = number
  default     = 1
}


variable "scaledown_recurrence" {
  description = "ScaleDown recurrence Cron Expression"
  type        = string
  default     = ""
}

variable "scheduled_action_name" {
  description = "ASG scheduling action name"
  type        = string
  default     = ""
}

variable "scaledown_desired_cap" {
  description = "The new desired size of size of Autoscaling Group scaledown scheduler"
  type        = number
  default     = -1
}

variable "time_zone" {
  description = "Enable or Disable the ASG scheduling"
  type        = string
  default     = ""
}

variable "scaleup_recurrence" {
  description = "ScaleUP recurrence Cron Expression"
  type        = string
  default     = ""
}

variable "scaleup_desired_cap" {
  description = "The new desired size of size of Autoscaling Group scaleup scheduler"
  type        = number
  default     = -1
}

variable "scaleback_recurrence" {  
  description = "ScaleBack (resume) recurrence Cron Expression"
  type        = string
  default     = ""
}