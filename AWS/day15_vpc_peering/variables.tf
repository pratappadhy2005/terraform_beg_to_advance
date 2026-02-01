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

variable "primary_region" {
  type        = string
  default     = "ap-southeast-2"
  description = "primary region"
}

variable "secondary_region" {
  type        = string
  default     = "ap-southeast-1"
  description = "secondary region"
}

variable "primary_vpc_cidr" {
  description = "CIDR block for the primary VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "secondary_vpc_cidr" {
  description = "CIDR block for the secondary VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "primary_subnet_cidr" {
  description = "CIDR block for the primary subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "secondary_subnet_cidr" {
  description = "CIDR block for the secondary subnet"
  type        = string
  default     = "10.1.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "primary_key_name" {
  description = "Name of the SSH key pair for Primary VPC instance (us-east-1)"
  type        = string
  default     = "vpc-peering-demo-southeast2"
}

variable "secondary_key_name" {
  description = "Name of the SSH key pair for Secondary VPC instance (us-west-2)"
  type        = string
  default     = "vpc-peering-demo-southeast1"
}
