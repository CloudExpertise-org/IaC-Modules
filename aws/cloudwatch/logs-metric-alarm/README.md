# AWS `aws/cloudwatch/logs-metric-alarm` Terraform Module Usage Guide

## Usage

```
module "alarm_myapplication_myerror" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/cloudwatch/logs-metric-alarm?ref=v0.0.1"

  environment   = "awsprod"
  friendly_name = "myProject"
  alarm_name    = "myAlarm"

  subscription_emails_list = ["me@example.com", "you@example.com", "them@example.com"]

  log_group_name = "/aws/containerinsights/eks-cluster/application"
  filter_pattern = "{$.log = \"*error*\" && $.kubernetes.namespace_name = \"somenamespace\"}"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_metric_filter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_metric_alarm.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/id) | resource |
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudwatch_log_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_name"></a> [alarm\_name](#input\_alarm\_name) | Name to be appended to CloudWatch Alarm name. | `string` | n/a | yes |
| <a name="input_cw_alarm_additional_actions"></a> [cw\_alarm\_additional\_actions](#input\_cw\_alarm\_additional\_actions) | List of additional actions to be performed by CloudWatch alarm when alarm is triggerd and cleared. Default = none | `list(string)` | `[]` | no |
| <a name="input_cw_alarm_comparison_operator"></a> [cw\_alarm\_comparison\_operator](#input\_cw\_alarm\_comparison\_operator) | CloudWatch alarm comparison operator. Default = GreaterThanOrEqualToThreshold | `string` | `"GreaterThanOrEqualToThreshold"` | no |
| <a name="input_cw_alarm_datapoints_to_alarm"></a> [cw\_alarm\_datapoints\_to\_alarm](#input\_cw\_alarm\_datapoints\_to\_alarm) | CloudWatch alarm datapoints to alarm. Default = 3 | `number` | `3` | no |
| <a name="input_cw_alarm_description"></a> [cw\_alarm\_description](#input\_cw\_alarm\_description) | Description of CloudWatch alarm. Default = none | `string` | `""` | no |
| <a name="input_cw_alarm_evaluation_periods"></a> [cw\_alarm\_evaluation\_periods](#input\_cw\_alarm\_evaluation\_periods) | CloudWatch alarm evaluation periods. Default = 3 | `number` | `3` | no |
| <a name="input_cw_alarm_insufficient_data_actions"></a> [cw\_alarm\_insufficient\_data\_actions](#input\_cw\_alarm\_insufficient\_data\_actions) | CloudWatch alarm insufficient data action. Default = none | `list(string)` | `[]` | no |
| <a name="input_cw_alarm_period"></a> [cw\_alarm\_period](#input\_cw\_alarm\_period) | CloudWatch alarm evaluation period. Default = 60 | `number` | `60` | no |
| <a name="input_cw_alarm_statistic"></a> [cw\_alarm\_statistic](#input\_cw\_alarm\_statistic) | CloudWatch alarm evaluation statistics. Default = Sum | `string` | `"Sum"` | no |
| <a name="input_cw_alarm_threshold"></a> [cw\_alarm\_threshold](#input\_cw\_alarm\_threshold) | CloudWatch alarm evaluation threshold. Default = 1 | `number` | `1` | no |
| <a name="input_cw_alarm_treat_missing_data"></a> [cw\_alarm\_treat\_missing\_data](#input\_cw\_alarm\_treat\_missing\_data) | CloudWatch alarm treat missing data. Default = missing | `string` | `"missing"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name this module is deployed into. Default = aws | `string` | `"aws"` | no |
| <a name="input_filter_pattern"></a> [filter\_pattern](#input\_filter\_pattern) | Filter pattern used by the metric filter. | `string` | n/a | yes |
| <a name="input_friendly_name"></a> [friendly\_name](#input\_friendly\_name) | The friendly name of this resource, used for resource naming. | `string` | n/a | yes |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | Name of the Log Group this metric filter is to be applied to. | `string` | n/a | yes |
| <a name="input_metric_transformation_default_value"></a> [metric\_transformation\_default\_value](#input\_metric\_transformation\_default\_value) | Metric Transformation - Default Value. Default = 0 | `number` | `0` | no |
| <a name="input_metric_transformation_value"></a> [metric\_transformation\_value](#input\_metric\_transformation\_value) | Metric Transformation - Value. Default = 1 | `number` | `1` | no |
| <a name="input_subscription_emails_list"></a> [subscription\_emails\_list](#input\_subscription\_emails\_list) | List of Email addresses subscribing to this notiication. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_cloudwatch_log_metric_filter_id"></a> [aws\_cloudwatch\_log\_metric\_filter\_id](#output\_aws\_cloudwatch\_log\_metric\_filter\_id) | The ID of CloudWatch Log Metric Filter created. |
| <a name="output_aws_cloudwatch_metric_alarm_arn"></a> [aws\_cloudwatch\_metric\_alarm\_arn](#output\_aws\_cloudwatch\_metric\_alarm\_arn) | The ARN of CloudWatch Metric Alarm created. |
| <a name="output_aws_cloudwatch_metric_alarm_id"></a> [aws\_cloudwatch\_metric\_alarm\_id](#output\_aws\_cloudwatch\_metric\_alarm\_id) | The ID of CloudWatch Metric Alarm created. |
| <a name="output_aws_sns_topic_arn"></a> [aws\_sns\_topic\_arn](#output\_aws\_sns\_topic\_arn) | The ARN of SNS Topic created. |
| <a name="output_aws_sns_topic_name"></a> [aws\_sns\_topic\_name](#output\_aws\_sns\_topic\_name) | The Name of SNS Topic created. |
| <a name="output_aws_sns_topic_subscription_list"></a> [aws\_sns\_topic\_subscription\_list](#output\_aws\_sns\_topic\_subscription\_list) | n/a |

## Note

### Input Variable `filter_pattern`

The following example filter pattern matches all log entries containing `error` collected from Kubernetes Namespace `somenamespace`, but excludes logs generated from sidecar container `container1` and `container2*`.

```
  filter_pattern = "{$.log = \"*error*\" && $.kubernetes.namespace_name = \"somenamespace\" && ($.kubernetes.container_name != \"container1\" && $.kubernetes.container_name != \"container2*\")}"
```

### CloudWatch Namespace

CloudWatch metric namespace is a container for CloudWatch metrics. While CloudWatch metrics in different namespaces are isolated from each other, CloudWatch namespace is not suitable for access control in IAM, as read operations such as `cloudwatch:GetMetricData` does not currently support conditional access based on CloudWatch namespace.

> https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazoncloudwatch.html