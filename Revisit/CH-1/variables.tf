variable "vpc_cidr" {
  description = "VPC CIDR Block"
  default     = "10.0.0.0/16"
  type        = string
}

variable "region" {
  description = "Region"
  default     = "ap-southeast-2"
  type        = string
}
