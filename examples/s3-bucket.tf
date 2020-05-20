module "s3-bucket-example" {
  # source = "git@github.com:joeaawad/terraform-modules.git//s3/bucket?ref=<ref>"
  source = "../s3/bucket"

  name = "example-name"

  tags_required = {
    env       = "testing"
    terraform = "terraform-modules"
  }
}

module "s3-bucket-example-all-variables" {
  # source = "git@github.com:joeaawad/terraform-modules.git//s3/bucket?ref=<ref>"
  source = "../s3/bucket"

  name = "example-name-all-variables"

  lifecycle_rules = [
    {
      id      = "cleanup all objects"
      prefix  = ""
      enabled = true
      actions = {
        transition = [
          {
            days          = 30
            storage_class = "STANDARD_IA"
          },
          {
            days          = 90
            storage_class = "GLACIER"
          },
        ],
        expiration = [
          {
            days = 365
          }
        ],
        noncurrent_version_transition = [
          {
            days          = 30
            storage_class = "GLACIER"
          },
        ],
        noncurrent_version_expiration = [
          {
            days = 180
          }
        ]
      }
    }
  ]

  logging = {
    target_bucket = "example-logging-bucket-name"
    target_prefix = "example-logging-prefix"
  }

  versioning = true

  tags_required = {
    env       = "testing"
    terraform = "terraform-modules"
  }
}

module "s3-bucket-example-only-current-version-lifecycle-rules" {
  # source = "git@github.com:joeaawad/terraform-modules.git//s3/bucket?ref=<ref>"
  source = "../s3/bucket"

  name = "example-name-only-current-version-lifecycle-rules"

  lifecycle_rules = [
    {
      id      = "cleanup logs"
      prefix  = "logs/"
      enabled = true
      actions = {
        transition = [
          {
            days          = 30
            storage_class = "STANDARD_IA"
          },
          {
            days          = 90
            storage_class = "GLACIER"
          },
        ],
        expiration = [
          {
            days = 365
          }
        ],
      }
    }
  ]

  tags_required = {
    env       = "testing"
    terraform = "terraform-modules"
  }
}
