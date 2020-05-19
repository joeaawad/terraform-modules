variable "lifecycle_rules" {
  default     = []
  description = "Bucket lifecycle rules"
  type = list(object({
    id      = string
    prefix  = string
    enabled = bool
    actions = map(list(map(string)))
  }))
}

variable "logging" {
  default     = null
  description = "Logging configuration"
  type = object({
    target_bucket = string
    target_prefix = string
  })
}

variable "name" {
  description = "Bucket name, will be prepended with `<env>-` from tags"
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

variable "versioning" {
  default     = false
  description = "If the bucket has versioning enabled"
  type        = bool
}
