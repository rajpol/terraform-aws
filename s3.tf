resource "aws_s3_bucket" "tfstate" {
  bucket = "terraformstatebucket-rajpol"
}

resource "aws_s3_bucket_versioning" "s3_version" {
    bucket = "aws_s3_bucket.tfstate.id"
    versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "s3_acl" {
    bucket = "aws_s3_bucket.tfstate.id"
    acl = "private"
}