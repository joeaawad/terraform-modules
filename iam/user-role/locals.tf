locals {
  principal_ids = var.principal_ids != null ? var.principal_ids : [data.aws_caller_identity.current.account_id]

  tags = merge(var.tags_custom, var.tags_required)
}
