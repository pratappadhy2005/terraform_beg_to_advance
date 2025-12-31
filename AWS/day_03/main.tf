terraform {
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

# create s3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "pratap-bucket-001"

  tags = {
    Name          = "Example Bucket"
    Environment   = "Dev"
    Documentation = "https://www.terraform.io/docs/providers/aws/r/s3_bucket.html"
  }
}
