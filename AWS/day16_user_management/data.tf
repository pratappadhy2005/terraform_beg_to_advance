data "aws_caller_identity" "name" {
  provider = aws.primary_region
}

output "current_account_id" {
  value = data.aws_caller_identity.name.account_id
}
