terraform {
  backend "s3" {
    bucket       = "pratap-bucket-tf-state"
    key          = "dev/terraform.tfstate"
    region       = "ap-southeast-2"
    encrypt      = true
    use_lockfile = true
  }
}
