# iam/service-role

A role for a specified AWS service to assume. See the following AWS links for
documentation on what services can assume roles.

* https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html
* https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_aws-services-that-work-with-iam.html

[Example](../../examples/iam-service-role.tf)

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| existing\_policies | Existing policy ARNs to attach to the role | `list(string)` | `[]` | no |
| name | Role name | `string` | n/a | yes |
| role\_managed\_policies | Role managed policies | `map(string)` | `{}` | no |
| service\_name | AWS service that can assume the role. Gets appended with '.amazonaws.com' to create the principal ID | `string` | n/a | yes |
| tags\_custom | Custom tags | `map(string)` | `{}` | no |
| tags\_required | Required tags | <pre>object({<br>    env       = string<br>    terraform = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | Role ARN |
