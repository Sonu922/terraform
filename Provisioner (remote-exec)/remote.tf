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

resource "aws_instance" "web" {
  ami           = "ami-05e786af422f8082a"
  instance_type = "t3.micro"
  key_name      = "demo"
  tags = {
    Name = "remote"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./demo.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update && apt upgrade -y",
      "sudo apt install nginx -y",
      
    ]
  }
}