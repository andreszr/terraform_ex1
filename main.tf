provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "demo-instance" {
  # colocar todos los parametros aqui 
  ami = "ami-08962a4068733a2b6"
  instance_type = "t2.micro"
  tags = {
    Name = "practica1"
    Environment = "Dev"
  }
}
