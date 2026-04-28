locals {
  vpc_name = (terraform.workspace == "dev" ? "PratapVPC" : "PratapVPC-dev")
}
