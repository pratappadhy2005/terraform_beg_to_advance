#create a variable
variable "environment" {
  default     = "devssss"
  description = "The environment to deploy to"
  type        = string
}

variable "region" {
  default     = "ap-southeast-2"
  description = "The region to deploy to"
  type        = string
}


