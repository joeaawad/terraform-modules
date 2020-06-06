# s3/bucket

Create a private s3 bucket with default encryption enabled.

[Example](../../examples/s3-bucket.tf)

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| lifecycle\_rules | Bucket lifecycle rules | <pre>list(object({<br>    id      = string<br>    prefix  = string<br>    enabled = bool<br>    actions = map(list(map(string)))<br>  }))</pre> | `[]` | no |
| logging | Logging configuration | <pre>object({<br>    target_bucket = string<br>    target_prefix = string<br>  })</pre> | `null` | no |
| name | Bucket name, will be prepended with `<env>-` from tags | `string` | n/a | yes |
| tags\_custom | Custom tags | `map(string)` | `{}` | no |
| tags\_required | Required tags | <pre>object({<br>    env       = string<br>    terraform = string<br>  })</pre> | n/a | yes |
| versioning | If the bucket has versioning enabled | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| id | n/a |
