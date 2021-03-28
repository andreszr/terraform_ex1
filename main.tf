provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "demo-instance" {
  # colocar todos los parametros aqui 
  ami = var.ami_id
  instance_type = var.instance_type
  tags = var.tags
}
