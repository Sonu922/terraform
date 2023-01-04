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
  ami_id  = var.ami_id
  instance_type = var.instance_type
  keyname = var.keyname
  subnet_id = module.VPC.subnet_id
  

}