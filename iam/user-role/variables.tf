variable "name" {
  description = "Role name"
  type        = string
}

variable "existing_policies" {
  default     = []
  description = "Existing policy ARNs to attach to the role"
  type        = list(string)
}

variable "principal_ids" {
  default     = null
  description = "AWS account ID or role/user ARN to allow assuming the role from. Defaults to current AWS account ID"
  type        = list(string)
}

variable "role_managed_policies" {
  default     = {}
  description = "Role managed policies"
  type        = map(string)
}

variable "tags_custom" {
  default     = {}
  description = "Custom tags"
  type        = map(string)
}

variable "tags_required" {
  description = "Required tags"
  type = object({
    env       = string
    terraform = string
  })
}
