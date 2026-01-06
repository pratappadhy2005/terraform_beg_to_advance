terraform {


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
  count                       = var.instance_count
  ami                         = "ami-0b3c832b6b7289e44"
  instance_type               = "t2.micro"
  region                      = var.region
  monitoring                  = var.monitoring
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name        = "${var.environment}-EC2"
    Environment = var.environment
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "${var.environment}-SG"
  description = "Security group for ${var.environment} environment"
  vpc_id      = aws_vpc.example.id

  tags = {
    Name        = "allow-tls"
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.cidr_block[0]
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.cidr_block[0]
  ip_protocol       = "-1"
  from_port         = 0
  to_port           = 0
}
