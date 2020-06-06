# dynamodb/table

Create a dynamodb table.

[Example](../../examples/dynamodb-table.tf)

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| hash\_key | Hash key for the table | `string` | n/a | yes |
| hash\_key\_type | Type of the hash\_key. Must be one of 'S', 'N', or 'B' | `string` | n/a | yes |
| name | Table name | `string` | n/a | yes |
| tags\_custom | Custom tags | `map(string)` | `{}` | no |
| tags\_required | Required tags | <pre>object({<br>    env       = string<br>    terraform = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| id | n/a |
