resource "aws_s3_bucket" "tfstate" {
  bucket = "myterraform-tfstate"
  acl    = "private"

  versioning {
    enabled = true
  }
}