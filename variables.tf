variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "igw_name" {}
variable "public_subnet1_cidr" {}
variable "public_subnet2_cidr" {}
variable "public_subnet1_dev_cidr" {}
variable "public_subnet2_dev_cidr" {}
variable "public_subnet1_name" {}
variable "public_subnet2_name" {}
variable "public_subnet1_dev_name" {}
variable "public_subnet2_dev_name" {}
variable "main-route-table" {}
variable "public_security_group1" {}
variable "keypair" {}
variable "awsprops" {
    type = map
    default = {
    region = "us-east-1"
    ami = "ami-08c40ec9ead489470"
    itype = "t2.micro"
    publicip = true
    keyname = "myseckey"
  }
}
