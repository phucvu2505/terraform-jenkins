terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
  backend "s3" {
    bucket = "phucvtdemo-terraform-state-testing"
    key = "services/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "phucvt-amz-ec2" {
  count = 2
  ami = "ami-02ee763250491e04a"
  instance_type = "t2.micro"

  tags = {
    Name = "phucvt-amz-ec2"
  }
}

