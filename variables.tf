variable "namespace_id" {
  description = "The ID of the EventHub Namespace"
  type        = string
  nullable    = false
}

variable "event_hub_name" {
  description = "The name of the EventHub"
  type        = string
  nullable    = false

  validation {
    condition     = can(regex("^[a-zA-Z0-9]([a-zA-Z0-9-]{0,49}[a-zA-Z0-9])?$", var.event_hub_name))
    error_message = "Event hub name must start and end with alphanumeric characters and can contain hyphens, 1-50 characters total."
  }
}

variable "partition_count" {
  description = "The number of partitions for the EventHub"
  type        = number
  default     = 2
  nullable    = false

  validation {
    condition     = var.partition_count > 0 && var.partition_count <= 32
    error_message = "Partition count must be between 1 and 32."
  }
}

variable "message_retention" {
  description = "The number of days to retain messages in the EventHub"
  type        = number
  default     = 1
  nullable    = false

  validation {
    condition     = var.message_retention > 0 && var.message_retention <= 90
    error_message = "Message retention must be between 1 and 90 days."
  }
}
