locals {
  bucket_name = join("-", [var.tags_required.env, var.name])

  tags = merge(var.tags_custom, var.tags_required)
}
