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

variable "allow_vm_types" {
  default     = ["t2.micro", "t2.small", "t2.medium"]
  description = "The list of EC2 instance types to allow"
  type        = list(string)
}

variable "allowed_regions" {
  default     = ["ap-southeast-2", "us-east-1"]
  description = "The list of regions to allow EC2 instance deployment"
  type        = set(string)
}

variable "tags" {
  default = {
    Name        = "dev-instance"
    Environment = "dev"
    CreatedBy   = "Terraform"
  }
  description = "The tags to apply to the resources"
  type        = map(string)
}

variable "ingress_rules" {
  type = tuple([
    string,
    string,
    number,
    number
  ])
  description = "The ingress rules to apply to the security group"
  default = [
    "0.0.0.0/0",
    "tcp",
    443,
    443
  ]
}

variable "config" {
  type = object({
    environment                 = string
    region                      = string
    instance_count              = number
    monitoring                  = bool
    associate_public_ip_address = bool
    cidr_block                  = list(string)
    allow_vm_types              = list(string)
    allowed_regions             = set(string)
    tags                        = map(string)
    ingress_rules = tuple([
      string,
      string,
      number,
      number
    ])
  })
  description = "The configuration for the EC2 instance"
  default = {
    environment                 = "dev"
    region                      = "ap-southeast-2"
    instance_count              = 1
    monitoring                  = true
    associate_public_ip_address = true
    cidr_block                  = ["10.0.0.0/8", "192.168.0.0/16", "172.16.0.0/12"]
    allow_vm_types              = ["t2.micro", "t2.small", "t2.medium"]
    allowed_regions             = ["ap-southeast-2", "us-east-1"]
    tags = {
      Name        = "dev-instance"
      Environment = "dev"
      CreatedBy   = "Terraform"
    }
    ingress_rules = [
      "0.0.0.0/0",
      "tcp",
      443,
      443
    ]
  }
}
