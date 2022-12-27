terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = "eu-west-1"
  access_key = "AKIA26K6UQZH2EDBGYU4"
  secret_key = "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"
}

resource "aws_instance" "dev" {
    ami = lookup(var.ami,var.region)
    instance_type = var.type
    key_name = "demo"
    count = 2
    tags = {
      Name = element(var.tags,count.index)
    }
    }



