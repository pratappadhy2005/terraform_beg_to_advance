provider "aws" {
  region = "ap-southeast-2"
}

terraform {
  backend "s3" {
    bucket       = "javahome-prata-tf"
    key          = "terraform.tfstate"
    region       = "ap-southeast-2"
    dynamo_table = "terraform-lock"
  }
}


# resource "aws_vpc" "exammy_vpc" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name        = "PratapVPC"
#     Environment = "Dev"
#     Owner       = "Pratap"
#     Project     = "Terraform"
#     Team        = "DevOps"
#   }
# }


# output "vpc_id" {
#   value = aws_vpc.exammy_vpc.id
# }
