resource "aws_dynamodb_table" "table" {
  name         = var.name
  hash_key     = var.hash_key
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }

  tags = local.tags
}
