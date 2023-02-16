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
| [aws_route53_resolver_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/route53_resolver_endpoint) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/security_group) | resource |
| [aws_security_group_rule.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/security_group_rule) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_direction"></a> [direction](#input\_direction) | The direction of this Resolver, INBOUND or OUTBOUND | `string` | `"INBOUND"` | no |
| <a name="input_hostnum"></a> [hostnum](#input\_hostnum) | The number of host passed to cidrhost() function to calculate IP used by Resolver ENI. | `number` | `53` | no |
| <a name="input_ingress_cidrs"></a> [ingress\_cidrs](#input\_ingress\_cidrs) | List of CIDRs permitted to access this Resolver ENI over TCP and UDP port 53. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | The name of Resolver. | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of Subnet IDs to be associated with this Resolver. | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID this Resolver is associated with. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the Route 53 Resolver endpoint. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Route 53 Resolver endpoint. |
| <a name="output_ip_list"></a> [ip\_list](#output\_ip\_list) | A list of IP addresses associated with this Route 53 Resolver. |
| <a name="output_security_group_ids"></a> [security\_group\_ids](#output\_security\_group\_ids) | A list of Security Group IDs associated with the Route 53 Resolver endpoint. |
