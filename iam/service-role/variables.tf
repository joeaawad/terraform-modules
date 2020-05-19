variable "name" {
  description = "Role name"
  type        = string
}

variable "existing_policies" {
  default     = []
  description = "Existing policy ARNs to attach to the role"
  type        = list(string)
}

variable "role_managed_policies" {
  default     = {}
  description = "Role managed policies"
  type        = map(string)
}

variable "service_name" {
  description = "AWS service to allow assuming the role from. Gets appended with '.amazonaws.com' to create the principal ID"
  type        = string
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
