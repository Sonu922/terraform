terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIARLK4EQU6TS4LCZSF"
  secret_key = "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"
}


resource "aws_instance" "new" {
    instance_type = var.instance_type
    ami = "ami-074dc0a6f6c764218"
  }