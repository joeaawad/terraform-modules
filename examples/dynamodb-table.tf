module "dynamodb-table-example" {
  # source = "git@github.com:joeaawad/terraform-modules.git//dynamodb/table?ref=<ref>"
  source = "../dynamodb/table"

  name = "example-name"

  hash_key      = "example-hash-key"
  hash_key_type = "S"

  tags_required = {
    env       = "testing"
    terraform = "terraform-modules"
  }
}
