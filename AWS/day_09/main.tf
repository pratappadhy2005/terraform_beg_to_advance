resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.allow_vm_types[0]
  region        = tolist(var.allowed_regions)[0]
  tags          = var.tags
  lifecycle {
    create_before_destroy = true
    prevent_destroy       = true
    ignore_changes        = [ami]
    replace_triggered_by  = [ami]
    postcondition {
      condition     = self.id != ""
      error_message = "EC2 instance failed to create"
    }
    precondition {
      condition     = self.id != ""
      error_message = "EC2 instance failed to create"
    }
  }
}
