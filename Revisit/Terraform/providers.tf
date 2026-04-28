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

#tf import aws_vpc.main vpc-0ee29614e3f51077a
# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "prata-vpc"
#   }
# }

# resource "aws_vpc" "exammy_vpc" {
#   count            = terraform.workspace == "dev" ? 1 : 0
#   cidr_block       = var.vpc_cidr
#   instance_tenancy = "default"

#   tags = {
#     Name        = "${locals.vpc_name}"
#     Environment = "${terraform.workspace}"
#     Owner       = "Pratap"
#     Project     = "Terraform"
#     Team        = "DevOps"
#   }
# }


# output "vpc_id" {
#   value = aws_vpc.exammy_vpc.id
# }
