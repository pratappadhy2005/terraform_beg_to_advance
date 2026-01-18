variable "project_name" {
  type        = string
  default     = "pratap"
  description = "project name"
}

variable "default_tag" {
  type = map(string)
  default = {
    "Name" = "pratap"
  }
  description = "default tag"
}

variable "environment_tags" {
  type = map(string)
  default = {
    "Environment" = "dev"
  }
  description = "environment tags"
}

variable "bucket_name" {
  type        = string
  default     = "PRATAP-bucket"
  description = "bucket name"
}
