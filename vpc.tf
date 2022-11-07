resource "aws_vpc" "terraform-vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "terraform-aws"
        Owner = "Rajasekhar Polavarapu"
        environment = "Dev"
    }
}

resource "aws_internet_gateway" "terraform-internet-gateway" {
    vpc_id = aws_vpc.terraform-vpc.id
        tags = {
        Name = "terraform-aws-igw"
    }
}

resource "aws_subnet" "public_subnet1" {
    vpc_id = aws_vpc.terraform-vpc.id
    cidr_block = var.public_subnet1_cidr
    availability_zone = "us-east-1a"

    tags = {
        Name = "${var.public_subnet1_name}"
    }
}

resource "aws_subnet" "public_subnet2" {
    vpc_id = aws_vpc.terraform-vpc.id
    cidr_block = var.public_subnet2_cidr
    availability_zone = "us-east-1b"

    tags = {
        Name = var.public_subnet2_name
    }
}

resource "aws_route_table" "public_routetable" {
    vpc_id = aws_vpc.terraform-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.terraform-internet-gateway.id
    }

    tags = {
        Name = var.main-route-table
    }
}

resource "aws_route_table_association" "terraform-public" {
    subnet_id = aws_subnet.public_subnet1.id
    route_table_id = aws_route_table.public_routetable.id
}

resource "aws_security_group" "public_security_group1" {
  name        = var.public_security_group1
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.terraform-vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }
}
