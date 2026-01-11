resource "aws_s3_bucket" "bucket1" {
  count  = length(var.bucket_name)
  bucket = var.bucket_name[count.index]
  tags   = var.tags
}
