terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.primary_region
  alias  = "primary_region"
}

provider "aws" {
  region = var.secondary_region
  alias  = "secondary_region"
}

# Temporary providers to resolve state error
provider "aws" {
  region = var.primary_region
  alias  = "primary"
}

