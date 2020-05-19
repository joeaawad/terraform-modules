locals {
  principal_id = join(".", [var.service_name, "amazonaws.com"])

  tags = merge(var.tags_custom, var.tags_required)
}
