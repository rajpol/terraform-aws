terraform {
  backend "s3" {
    bucket = "terraformstatebucket"
    dynamodb_table = "terraform-state-lock-dynamo"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}