data "aws_iam_policy_document" "assume-role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = [local.principal_id]
    }
  }
}

resource "aws_iam_role" "role" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume-role.json

  tags = local.tags
}

resource "aws_iam_role_policy" "policy" {
  for_each = var.role_managed_policies

  name   = each.key
  policy = each.value
  role   = aws_iam_role.role.arn
}

resource "aws_iam_role_policy_attachment" "policy" {
  for_each = toset(var.existing_policies)

  policy_arn = each.value
  role       = aws_iam_role.role.arn
}
