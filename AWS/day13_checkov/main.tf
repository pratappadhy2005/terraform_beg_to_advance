resource "aws_s3_bucket" "public_bucket" {
  bucket = "my-public-demo-bucket"
}

resource "aws_s3_bucket_acl" "public_acl" {
  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.public_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# checkov -d .
#What You Should See

#❌ Public S3 bucket
#❌ SSH open to 0.0.0.0/0

#Terraform did NOT warn you. Checkov did.
