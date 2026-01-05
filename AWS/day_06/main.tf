terraform {


}

# Configure the AWS Provider


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

locals {
  bucket_name = "${var.environment}-Bucket-${var.region}"
}

# create s3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = local.bucket_name

  tags = {
    Name          = local.bucket_name
    Environment   = var.environment
    Documentation = "https://www.terraform.io/docs/providers/aws/r/s3_bucket.html"
  }
}

#create a vpc
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name        = "${var.environment}-VPC"
    Environment = var.environment
  }
}

#create a EC2
resource "aws_instance" "example" {
  ami           = "ami-0b3c832b6b7289e44"
  instance_type = "t2.micro"
  region        = var.region
  tags = {
    Name        = "${var.environment}-EC2"
    Environment = var.environment
  }
}


