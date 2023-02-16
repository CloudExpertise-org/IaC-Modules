# `aws/ec2/asg` Terraform Module

This module creates an EC2 Auto Scaling Group. 

## Usage Example

```hcl
module "worker" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//aws/ec2/asg?ref=v0.0.1"

  name = "worker"

  # Uses latest Amazon Linux 2 AMI
  ami_owners = ["amazon"]
  ami_filters = [
    {
      name   = "name"
      values = ["amzn2-ami-hvm*"]
    }
  ]

  asg_size_max     = 10
  asg_size_desired = 5
  asg_size_min     = 2

  instance_type          = "t3.small"
  subnet_ids_list        = var.subnet_ids_list
  vpc_security_group_ids = var.vpc_security_group_ids
}
```

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
| [aws_autoscaling_group.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/autoscaling_group) | resource |
| [aws_launch_template.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/launch_template) | resource |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_ami.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_filters"></a> [ami\_filters](#input\_ami\_filters) | List of map of key/value pair used to match the source AMI. | <pre>list(object({<br>    name   = string<br>    values = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_ami_owners"></a> [ami\_owners](#input\_ami\_owners) | List of owners of AMI. | `list(string)` | n/a | yes |
| <a name="input_asg_size_desired"></a> [asg\_size\_desired](#input\_asg\_size\_desired) | The desired size of Autoscaling Group. Must meet condition ( max >= desired >= min ). | `number` | `2` | no |
| <a name="input_asg_size_max"></a> [asg\_size\_max](#input\_asg\_size\_max) | The maximum size of Autoscaling Group. Must meet condition ( max >= desired >= min ). | `number` | `2` | no |
| <a name="input_asg_size_min"></a> [asg\_size\_min](#input\_asg\_size\_min) | The minimum size of Autoscaling Group. Must meet condition ( max >= desired >= min ). | `number` | `1` | no |
| <a name="input_asg_tags_list"></a> [asg\_tags\_list](#input\_asg\_tags\_list) | A list of additional Key/Value pair of tags to be associated with the ASG. | <pre>list(object({<br>    key                 = string<br>    value               = string<br>    propagate_at_launch = bool<br>  }))</pre> | `[]` | no |
| <a name="input_block_device_mappings"></a> [block\_device\_mappings](#input\_block\_device\_mappings) | List of EBS device and size mapping, if supplied overrides values provided by AMI | <pre>list(object({<br>    device_name = string<br>    ebs = object({<br>      volume_type = string<br>      volume_size = number<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | The IAM Instance Profile name assigned to the instance. | `string` | `""` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type name. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of Launch Template and Autoscaling Group. | `string` | n/a | yes |
| <a name="input_name_override_asg"></a> [name\_override\_asg](#input\_name\_override\_asg) | If provided, overrides generated name for Autoscaling Group. | `string` | `""` | no |
| <a name="input_name_override_lt"></a> [name\_override\_lt](#input\_name\_override\_lt) | If provided, overrides generated name for Launch Template. | `string` | `""` | no |
| <a name="input_subnet_ids_list"></a> [subnet\_ids\_list](#input\_subnet\_ids\_list) | A list of subnet IDs for Autoscaling Group to launch instances in. | `list(string)` | n/a | yes |
| <a name="input_user_data_base64"></a> [user\_data\_base64](#input\_user\_data\_base64) | Base64-encoded user data to provide when launching the instance. | `string` | `""` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | A list of VPC Security Group IDs to be used. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ami"></a> [ami](#output\_ami) | The AMI selected. |
| <a name="output_asg_id"></a> [asg\_id](#output\_asg\_id) | The ID of Autoscaling Group created. |
| <a name="output_launchtemplate_id"></a> [launchtemplate\_id](#output\_launchtemplate\_id) | The ID of Launch Template created. |
