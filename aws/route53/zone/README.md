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
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | The Fully Qualified Domain Name of the Route 53 Zone. | `string` | n/a | yes |
| <a name="input_vpc_ids"></a> [vpc\_ids](#input\_vpc\_ids) | A list of VPC IDs to associate this R53 zone with. If provided automatically makes the zone private. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of Route53 zone. |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The FQDN of Route53 zone. |
| <a name="output_id"></a> [id](#output\_id) | The ID of Route53 zone. |
| <a name="output_name"></a> [name](#output\_name) | The name of Route53 zone. |
| <a name="output_nameservers"></a> [nameservers](#output\_nameservers) | The ID of Route53 zone. |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | The VPCs associated with this Route53 zone. |
