# ECR repo
resource "aws_ecr_repository" "ECR_REPO" {
  name = var.aws_ecr_repository
}

# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
}

# Subnet
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr
}

# EC2
resource "aws_instance" "EC2" {
  ami           = var.ec2_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.my_subnet.id
}