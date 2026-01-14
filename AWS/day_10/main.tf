resource "aws_instance" "example" {
  ami           = "ami-0b3c832b6b7289e44"
  count         = var.instance_count
  instance_type = var.environment == "dev" ? var.allow_vm_types[0] : var.allow_vm_types[1]
  tags          = var.tags
}

resource "aws_security_group" "ingress_rule" {
  name = "sg"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.ip_protocol
      cidr_blocks      = [ingress.value.cidr_ipv4]
      description      = "ingress rule"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  }


  egress = []
}

locals {
  all_instance_id = aws_instance.example[*].id
}

output "all_instance_id" {
  value = local.all_instance_id
}
