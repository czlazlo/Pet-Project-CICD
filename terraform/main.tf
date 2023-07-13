terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block                       = "10.0.0.0/16"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create public subnet
resource "aws_subnet" "my_public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
}

# Create private subnet
resource "aws_subnet" "my_private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

# Create route table for private subnet
resource "aws_route_table" "my_private_rt" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create route table for public subnet
resource "aws_route_table" "my_public_rt" {
  vpc_id = aws_vpc.my_vpc.id
}

# Associate route table with public subnet
resource "aws_route_table_association" "my_public_rt_association" {
  subnet_id      = aws_subnet.my_public_subnet.id
  route_table_id = aws_route_table.my_public_rt.id
}

# Associate route table with private subnet
resource "aws_route_table_association" "my_private_rt_association" {
  subnet_id      = aws_subnet.my_private_subnet.id
  route_table_id = aws_route_table.my_private_rt.id
}

# Create EC2 instance in private subnet
resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-06ca3ca175f37dd66"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_private_subnet.id
  key_name      = "Head-in-the-cloud"
}

# Create EC2 instance in public subnet
resource "aws_instance" "bastion_host" {
  ami             = "ami-06ca3ca175f37dd66"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.my_public_subnet.id
  security_groups = [aws_security_group.this.id]
  key_name        = "Head-in-the-cloud"
}

# Allocate an Elastic IP address
resource "aws_eip" "my_eip" {
}

# Create NAT Gateway
resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.my_public_subnet.id
}

# Create route for private subnet to use NAT Gateway
resource "aws_route" "private_subnet_route" {
  route_table_id         = aws_route_table.my_private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.my_nat_gateway.id
}

# Create route for private subnet to use Internet Gateway
resource "aws_route" "public_subnet_route" {
  route_table_id         = aws_route_table.my_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_internet_gateway.id
}

# Create security group
resource "aws_security_group" "this" {
  vpc_id = aws_vpc.my_vpc.id
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = -1
  }
}
