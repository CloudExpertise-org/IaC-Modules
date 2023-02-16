resource "aws_s3_bucket" "this" {
  bucket = var.name
  acl    = var.acl
  policy = var.policy

  versioning {
    enabled = var.versioning_enabled
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_enabled == true ? [1] : []
    content {
      id      = var.lifecycle_id
      enabled = true

      expiration {
        expired_object_delete_marker = var.expired_object_delete_marker
      }

      noncurrent_version_expiration {
        days = var.noncurrent_version_expiration_days
      }

      abort_incomplete_multipart_upload_days = var.abort_incomplete_multipart_upload_days
    }
  }
}
