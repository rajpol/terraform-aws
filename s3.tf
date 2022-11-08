# resource "aws_s3_bucket" "tfstate" {
#   bucket = "terraformstatebucket"
#   acl    = "private"

#   versioning {
#     enabled = true
#   }
# }