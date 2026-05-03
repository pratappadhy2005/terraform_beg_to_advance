provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "javahome-prata-tf"
    key            = "terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-lock"
  }
}

