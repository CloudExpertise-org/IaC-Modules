## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.67.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_schedule.scaleback](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/autoscaling_schedule) | resource |
| [aws_autoscaling_schedule.scaledown](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/autoscaling_schedule) | resource |
| [aws_autoscaling_schedule.scaleup](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/autoscaling_schedule) | resource |
| [random_id.scaleback_recurrence](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_id.scaledown_recurrence](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_id.scaleup_recurrence](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg_name"></a> [asg\_name](#input\_asg\_name) | Name of Launch Template and Autoscaling Group. | `string` | n/a | yes |
| <a name="input_asg_size_desired"></a> [asg\_size\_desired](#input\_asg\_size\_desired) | The desired size of Autoscaling Group. Must meet condition ( max >= desired >= min ). | `number` | `2` | no |
| <a name="input_asg_size_max"></a> [asg\_size\_max](#input\_asg\_size\_max) | The maximum size of Autoscaling Group. Must meet condition ( max >= desired >= min ). | `number` | `2` | no |
| <a name="input_asg_size_min"></a> [asg\_size\_min](#input\_asg\_size\_min) | The minimum size of Autoscaling Group. Must meet condition ( max >= desired >= min ). | `number` | `1` | no |
| <a name="input_scaleback_recurrence"></a> [scaleback\_recurrence](#input\_scaleback\_recurrence) | ScaleBack (resume) recurrence Cron Expression | `string` | `""` | no |
| <a name="input_scaledown_desired_cap"></a> [scaledown\_desired\_cap](#input\_scaledown\_desired\_cap) | The new desired size of size of Autoscaling Group scaledown scheduler | `number` | `-1` | no |
| <a name="input_scaledown_recurrence"></a> [scaledown\_recurrence](#input\_scaledown\_recurrence) | ScaleDown recurrence Cron Expression | `string` | `""` | no |
| <a name="input_scaleup_desired_cap"></a> [scaleup\_desired\_cap](#input\_scaleup\_desired\_cap) | The new desired size of size of Autoscaling Group scaleup scheduler | `number` | `-1` | no |
| <a name="input_scaleup_recurrence"></a> [scaleup\_recurrence](#input\_scaleup\_recurrence) | ScaleUP recurrence Cron Expression | `string` | `""` | no |
| <a name="input_scheduled_action_name"></a> [scheduled\_action\_name](#input\_scheduled\_action\_name) | ASG scheduling action name | `string` | `""` | no |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | Enable or Disable the ASG scheduling | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_scaleback_aws_autoscaling_schedule"></a> [scaleback\_aws\_autoscaling\_schedule](#output\_scaleback\_aws\_autoscaling\_schedule) | The name of scaleback schedule |
| <a name="output_scaledown_aws_autoscaling_schedule"></a> [scaledown\_aws\_autoscaling\_schedule](#output\_scaledown\_aws\_autoscaling\_schedule) | The name of scaledown schedule |
| <a name="output_scaleup_aws_autoscaling_schedule"></a> [scaleup\_aws\_autoscaling\_schedule](#output\_scaleup\_aws\_autoscaling\_schedule) | The name of scaleup schedule |
