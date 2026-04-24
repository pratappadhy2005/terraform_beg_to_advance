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


resource "aws_vpc" "exammy_vpc" {
  count            = 1
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name        = "PratapVPC"
    Environment = "${terraform.workspace}"
    Owner       = "Pratap"
    Project     = "Terraform"
    Team        = "DevOps"
  }
}


output "vpc_id" {
  value = aws_vpc.exammy_vpc.id
}
