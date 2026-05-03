resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name        = "Pratap_VPC"
    Environment = "${terraform.workspace}"
  }
}

resource "aws_subnet" "main" {
  count      = 3
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index)
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "Subnet-${count.index}"
  }
}
