#Simple S3 Bucket using all 3 types of variables
resource "aws_s3_bucket" "demo" {
  bucket = local.full_bucket_name #Local variable (bucket name) computed
  
  tags = local.common_tags #Local variable (tags)
}