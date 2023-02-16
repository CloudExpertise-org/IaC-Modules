variable "environment" {
  type        = string
  default     = "aws"
  description = "The environment name this module is deployed into. Default = aws"
}

variable "friendly_name" {
  type        = string
  description = "The friendly name of this resource, used for resource naming."
}

variable "alarm_name" {
  type        = string
  description = "Name to be appended to CloudWatch Alarm name."
}

variable "subscription_emails_list" {
  type        = list(string)
  description = "List of Email addresses subscribing to this notiication."
}

variable "log_group_name" {
  type        = string
  description = "Name of the Log Group this metric filter is to be applied to."
}

variable "filter_pattern" {
  type        = string
  description = "Filter pattern used by the metric filter."
}

variable "metric_transformation_default_value" {
  type        = number
  default     = 0
  description = "Metric Transformation - Default Value. Default = 0"
}

variable "metric_transformation_value" {
  type        = number
  default     = 1
  description = "Metric Transformation - Value. Default = 1"
}

variable "cw_alarm_description" {
  type        = string
  default     = ""
  description = "Description of CloudWatch alarm. Default = none"
}

variable "cw_alarm_additional_actions" {
  type        = list(string)
  default     = []
  description = "List of additional actions to be performed by CloudWatch alarm when alarm is triggerd and cleared. Default = none"
}

variable "cw_alarm_comparison_operator" {
  type        = string
  default     = "GreaterThanOrEqualToThreshold"
  description = "CloudWatch alarm comparison operator. Default = GreaterThanOrEqualToThreshold"
}

variable "cw_alarm_datapoints_to_alarm" {
  type        = number
  default     = 3
  description = "CloudWatch alarm datapoints to alarm. Default = 3"
}

variable "cw_alarm_evaluation_periods" {
  type        = number
  default     = 3
  description = "CloudWatch alarm evaluation periods. Default = 3"
}

variable "cw_alarm_insufficient_data_actions" {
  type        = list(string)
  default     = []
  description = "CloudWatch alarm insufficient data action. Default = none"
}

variable "cw_alarm_period" {
  type        = number
  default     = 60
  description = "CloudWatch alarm evaluation period. Default = 60"
}

variable "cw_alarm_statistic" {
  type        = string
  default     = "Sum"
  description = "CloudWatch alarm evaluation statistics. Default = Sum"
}

variable "cw_alarm_threshold" {
  type        = number
  default     = 1
  description = "CloudWatch alarm evaluation threshold. Default = 1"
}

variable "cw_alarm_treat_missing_data" {
  type        = string
  default     = "missing"
  description = "CloudWatch alarm treat missing data. Default = missing"
}
