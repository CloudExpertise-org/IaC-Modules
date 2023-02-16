resource "aws_ssm_document" "this" {
  name            = var.name
  document_format = var.document_format
  document_type   = var.document_type
  content         = var.document_content
}
