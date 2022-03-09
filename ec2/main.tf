terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.7"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "vpc" {
  vpc_name = "${var.vpc_name}"
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet
  availability_zone = "us-east-2a"
}

resource "aws_security_group" "security_group" {
  name        = "Variable-SG"
  description = "Security group for variables lab"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.vpc.id
}

resource "aws_instance" "instance" {
    ami           = lookup(var.ami_ids, var.os_type, null)
    instance_type = var.instance_size
    vpc_security_group_ids = [aws_security_group.security_group.id]
    subnet_id = aws_subnet.subnet.id               

    root_block_device {
        delete_on_termination = var.disk.delete_on_termination
        encrypted = var.disk.encrypted
        volume_size = var.disk.volume_size
        volume_type = var.disk.volume_type
    }

    tags = {
        Name = var.instance_name
    }
}