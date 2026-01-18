
locals {
  formatted_project_name = lower(replace(var.project_name, "-", ""))
  formatted_bucket_name  = replace(substr(lower(var.bucket_name), 0, 10), " ", "")
  new_tag = merge(var.default_tag, var.environment_tags, {
    "Project" = local.formatted_project_name
  })
}

resource "aws_s3_bucket" "example" {
  bucket = local.formatted_bucket_name

  tags = local.new_tag
}
