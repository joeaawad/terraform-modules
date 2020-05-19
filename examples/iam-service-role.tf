data "aws_iam_policy" "iam-service-role-example-existing-policy" {
  arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

data "aws_iam_policy_document" "iam-service-role-example-role-managed-policy" {
  statement {
    effect    = "Deny"
    actions   = ["s3:GetObject"]
    resources = ["*"]
  }
}

module "iam-service-role-example" {
  # source = "git@github.com:joeaawad/terraform-modules.git//iam/service-role?ref=master"
  source = "../iam/service-role"

  name = "example-name"

  service_name = "lambda"

  existing_policies = [
    data.aws_iam_policy.iam-service-role-example-existing-policy.arn
  ]

  role_managed_policies = {
    iam-service-role-example-role-managed-policy = data.aws_iam_policy_document.iam-service-role-example-role-managed-policy.json
  }

  tags_required = {
    env       = "testing"
    terraform = "terraform-modules"
  }
}
