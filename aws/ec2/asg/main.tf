# random id - to append to resource names to avoid conflicts
resource "random_id" "suffix" {
  byte_length = 4
}

locals {
  asg_tags_list = concat(
    [{
      key                 = "Name"
      value               = var.name_override_asg == "" ? "${var.name}-${random_id.suffix.hex}" : var.name_override_asg
      propagate_at_launch = true
    }],
    var.asg_tags_list
  )
}

# Finds AMI ID by filters
data "aws_ami" "this" {
  most_recent = true

  owners = var.ami_owners

  dynamic "filter" {
    for_each = var.ami_filters
    content {
      name   = filter.value["name"]
      values = filter.value["values"]
    }
  }
}

# Creates Launch Template to be used by ASG
resource "aws_launch_template" "this" {
  # Defines resource name
  name = var.name_override_lt == "" ? "${var.name}-${random_id.suffix.hex}" : var.name_override_lt

  # Uses AMI ID from data source
  image_id = data.aws_ami.this.id

  # Configures instance type
  instance_type = var.instance_type

  # Configures VPC Security Groups
  vpc_security_group_ids = var.vpc_security_group_ids

  # Defines user data to be passed to instance during launch
  user_data = var.user_data_base64 == "" ? null : var.user_data_base64

  # Overrides EBS configuration based on var.block_device_mappings (if supplied)
  dynamic "block_device_mappings" {
    for_each = var.block_device_mappings == [] ? [] : var.block_device_mappings
    content {
      device_name = block_device_mappings.value["device_name"]

      dynamic "ebs" {
        for_each = [block_device_mappings.value["ebs"]]
        content {
          volume_type = ebs.value["volume_type"]
          volume_size = ebs.value["volume_size"]
        }
      }
    }
  }

  # Configures IAM instance role
  dynamic "iam_instance_profile" {
    for_each = [var.iam_instance_profile] == [] ? [] : [var.iam_instance_profile]
    content {
      name = iam_instance_profile.value
    }
  }
}

resource "aws_autoscaling_group" "this" {
  # Defines resource name
  name = var.name_override_asg == "" ? "${var.name}-${random_id.suffix.hex}" : var.name_override_asg

  # Defines min/desired/max size
  max_size         = var.asg_size_max
  desired_capacity = var.asg_size_desired
  min_size         = var.asg_size_min

  vpc_zone_identifier = var.subnet_ids_list

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  dynamic "tag" {
    for_each = local.asg_tags_list
    content {
      key                 = tag.value["key"]
      value               = tag.value["value"]
      propagate_at_launch = tag.value["propagate_at_launch"]
    }
  }

  lifecycle {
    ignore_changes = [
      desired_capacity, max_size, min_size, tag, tags, load_balancers, target_group_arns
    ]
  }
}

