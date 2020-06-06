variable "hash_key" {
  description = "Hash key for the table"
  type        = string
}

variable "hash_key_type" {
  description = "Type of the hash_key. Must be one of 'S', 'N', or 'B'"
  type        = string
}

variable "name" {
  description = "Table name"
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
