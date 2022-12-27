terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

############### Configure the AWS provider ######################

provider "aws" {
  region     = "eu-west-1"
  access_key = "AKIA26K6UQZH2EDBGYU4"
  secret_key = "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"
}

############### Variable ##################################

variable "testing" {
}

################### ec2 instance (condition)#################

resource "aws_instance" "dev" {
   ami = "ami-0fe0b2cf0e1f25c8a"  
   instance_type = "t2.micro" 
   count = var.testing == "false" ? 2 : 0
   
}
  
resource "aws_instance" "Prod" {
   ami = "ami-0fe0b2cf0e1f25c8a"  
   instance_type = "t2.micro"
   count = var.testing == "true" ? 3 : 0
}