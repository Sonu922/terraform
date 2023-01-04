

  resource "aws_instance" "ec2" {
  ami           = var.ami_id
  
  subnet_id = var.subnet_id
  instance_type = var.instance_type
  key_name      = var.keyname
  module "sg" {
    source = "./modules/securitygroup"
    
  }
  tags = {
    Name = "remote"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./modules/ec2Module/Demo.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update && apt upgrade -y",
      "sudo apt install nginx -y"
      
    ]
  }
}