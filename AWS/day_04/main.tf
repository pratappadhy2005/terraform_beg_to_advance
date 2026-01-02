terraform {

  backend "s3" {
    bucket       = "pratap-bucket-tf-state"
    key          = "dev/terraform.tfstate"
    region       = "ap-southeast-2"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-2"
}

#create a variable
variable "environment" {
  default     = "Dev"
  description = "The environment to deploy to"
  type        = string
}

# create s3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "pratap-bucket-001"

  tags = {
    Name          = "${var.environment}-Bucket"
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
resource "aws_ec2_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name        = "${var.environment}-EC2"
    Environment = var.environment
  }
}
