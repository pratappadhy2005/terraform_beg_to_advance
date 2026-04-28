resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "prata-vpc"
  }
}

import {
  id = "vpc-0b56e056b51b2f723"
  to = aws_vpc.main
}
