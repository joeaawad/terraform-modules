# iam/user-role

A role for users to assume.

The role can be assumed from a whitelist of entities. These entities can be the
entirity of an AWS account (specified by the AWS account ID), an IAM user
(specified by ARN), or an IAM role (specified by ARN).

[Example](../../examples/iam-user-role.tf)

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| existing\_policies | Existing policy ARNs to attach to the role | `list(string)` | `[]` | no |
| name | Role name | `string` | n/a | yes |
| principal\_ids | AWS account ID or role/user ARN to allow assuming the role from. Defaults to current AWS account ID | `list(string)` | `null` | no |
| role\_managed\_policies | Role managed policies | `map(string)` | `{}` | no |
| tags\_custom | Custom tags | `map(string)` | `{}` | no |
| tags\_required | Required tags | <pre>object({<br>    env       = string<br>    terraform = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | Role ARN |
