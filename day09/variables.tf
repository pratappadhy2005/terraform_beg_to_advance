variable "environment" {
  type        = string
  description = "the env type"
  default     = "staging"
}

variable "storage_disk" {
  type        = number
  description = "the storage size of the disk"
  default     = 80
}

variable "delete_disk_on_termination" {
  type        = bool
  description = "default disk termination on vm deletion"
  default     = true
}

variable "allowed_locations" {
  type        = list(string)
  description = "list of allowed locations"
  default     = ["West Europe"]
}

variable "allowed_tags" {
  type        = map(string)
  description = "list of allowed tags"
  default = {
    "environment" = "staging"
    "managed_by"  = "terraform"
  }
}

variable "network_config" {
  type        = tuple([string, string, number])
  description = "Netwrok configuration"
  default     = ["10.0.0.0/16", "10.0.2.0", 24]
}

variable "storage_account_name" {
  type        = list(string)
  description = "value"
  default     = ["pratap", "prayan"]
}

variable "storage_account_name_set" {
  type        = set(string)
  description = "value"
  default     = ["pratap", "prayan"]
}
