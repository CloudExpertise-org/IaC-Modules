data "aws_route_tables" "this" {
  vpc_id = var.vpc_id
}

resource "aws_vpc_endpoint" "this" {
  for_each = toset(var.service_names)

  vpc_endpoint_type = "Gateway"

  vpc_id       = var.vpc_id
  service_name = "com.amazonaws.${var.aws_region}.${each.key}"

  route_table_ids = data.aws_route_tables.this.ids
}
