## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpc_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/vpc_endpoint) | resource |
| [aws_route_tables.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/route_tables) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region name, e.g., eu-west-1. | `string` | n/a | yes |
| <a name="input_service_names"></a> [service\_names](#input\_service\_names) | A list of name of services to create VPC Endpoint for, e.g., ec2 or dynamodb. | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of VPC. | `string` | n/a | yes |

## Outputs

No outputs.
