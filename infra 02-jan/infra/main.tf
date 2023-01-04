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
  access_key = var.access_key
  secret_key = var.secret_key
}


module "VPC" {
  source = "../modules/vpc"
  azs = "eu-west-1a"
  
  
}


module "EC2pub" {
  source = "../modules/ec2Module"
  subnet_id = module.aws_subnet.pubsub.id
  ami_id  = var.ami_id
  instance_type = var.instance_type
  keyname = var.keyname

  

}