resource "aws_s3_bucket" "bucket" {
  bucket = local.bucket_name
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules

    content {
      id      = lifecycle_rule.value.id
      prefix  = lifecycle_rule.value.prefix
      enabled = lifecycle_rule.value.enabled

      dynamic "transition" {
        for_each = lookup(lifecycle_rule.value.actions, "transition", [])

        content {
          days          = transition.value.days
          storage_class = transition.value.storage_class
        }
      }

      dynamic "expiration" {
        for_each = lookup(lifecycle_rule.value.actions, "expiration", [])

        content {
          days = expiration.value.days
        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = lookup(lifecycle_rule.value.actions, "noncurrent_version_transition", [])

        content {
          days          = noncurrent_version_transition.value.days
          storage_class = noncurrent_version_transition.value.storage_class
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = lookup(lifecycle_rule.value.actions, "noncurrent_version_expiration", [])

        content {
          days = noncurrent_version_expiration.value.days
        }
      }
    }
  }

  dynamic "logging" {
    for_each = var.logging != null ? [var.logging] : []

    content {
      target_bucket = logging.value.target_bucket
      target_prefix = logging.value.target_prefix
    }
  }

  dynamic "versioning" {
    for_each = var.versioning ? [true] : []

    content {
      enabled = true
    }
  }

  tags = local.tags
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
