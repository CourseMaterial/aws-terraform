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

resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "state_testing_vpc11"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-2a"
}

resource "aws_vpc" "vpc2" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "state_testing_vpc2"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.vpc2.id
  cidr_block = "10.1.0.0/24"
  availability_zone = "us-east-2b"
}

