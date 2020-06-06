locals {
  tags = merge(var.tags_custom, var.tags_required)
}
