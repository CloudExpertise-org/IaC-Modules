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
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/3.67.0/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_abort_incomplete_multipart_upload_days"></a> [abort\_incomplete\_multipart\_upload\_days](#input\_abort\_incomplete\_multipart\_upload\_days) | The number of days after initiating a multipart upload when the multipart upload must be completed. | `number` | `7` | no |
| <a name="input_acl"></a> [acl](#input\_acl) | The canned ACL to apply. Defaults to private. | `string` | `"private"` | no |
| <a name="input_expired_object_delete_marker"></a> [expired\_object\_delete\_marker](#input\_expired\_object\_delete\_marker) | Enable the deletion of expired delete markers. | `bool` | `true` | no |
| <a name="input_lifecycle_enabled"></a> [lifecycle\_enabled](#input\_lifecycle\_enabled) | Enable S3 lifecycle policy to limit the number of noncurrent objects. | `bool` | `false` | no |
| <a name="input_lifecycle_id"></a> [lifecycle\_id](#input\_lifecycle\_id) | The ID of S3 lifecycle policy. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the S3 bucket. If not supplied Terraform will assign a random, unique name. | `string` | `null` | no |
| <a name="input_noncurrent_version_expiration_days"></a> [noncurrent\_version\_expiration\_days](#input\_noncurrent\_version\_expiration\_days) | The number of days for noncurrent\_version\_expiration. | `number` | `360` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | The JSON document bucket policy to apply to bucket. | `string` | `null` | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | Enables S3 bucket versioning. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the bucket. |
| <a name="output_id"></a> [id](#output\_id) | The name of the bucket. |
