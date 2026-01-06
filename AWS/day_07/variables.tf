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

variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number
}

variable "monitoring" {
  default     = true
  description = "Enable EC2 monitoring"
  type        = bool
}

variable "associate_public_ip_address" {
  default     = true
  description = "Associate a public IP address with the EC2 instance"
  type        = bool
}

variable "cidr_block" {
  default     = ["10.0.0.0/8", "192.168.0.0/16", "172.16.0.0/12"]
  description = "The CIDR block for the VPC"
  type        = list(string)
}
