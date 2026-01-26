variable "instance_count" {
  type        = number
  default     = 1
  description = "instance count"
}

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
  default     = "pratap-static-website-bucket"
  description = "bucket name"
}
