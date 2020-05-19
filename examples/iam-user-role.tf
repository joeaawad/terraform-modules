data "aws_iam_policy" "iam-user-role-example-existing-policy" {
  arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

data "aws_iam_policy_document" "iam-user-role-example-role-managed-policy" {
  statement {
    effect    = "Deny"
    actions   = ["s3:GetObject"]
    resources = ["*"]
  }
}

module "iam-user-role-example" {
  # source = "git@github.com:joeaawad/terraform-modules.git//iam/user-role?ref=master"
  source = "../iam/user-role"

  name = "example-name"

  existing_policies = [
    data.aws_iam_policy.iam-user-role-example-existing-policy.arn
  ]

  role_managed_policies = {
    iam-user-role-example-role-managed-policy = data.aws_iam_policy_document.iam-user-role-example-role-managed-policy.json
  }

  tags_required = {
    env       = "testing"
    terraform = "terraform-modules"
  }
}
