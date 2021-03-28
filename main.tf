provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "demo-instance" {
  # colocar todos los parametros aqui 
  ami = var.ami_id
  instance_type = var.instance_type
  tags = var.tags
  security_groups = [aws_security_group.ssh_connection.name]
  associate_public_ip_address = true
  key_name = "ssh-key"
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCeGp1xBayd2Mbddy/5QliKoPQ6VTDL1qPoXliQaNTg+6wTNEBoLc3jtQe6XAdX10vVSrEYI9yVqMdkRP3xCLMR2Y1tLlTc+nBkOUUZPtyNxQGUq8IMv5NplTZScPaofGq7DX0JtGU5Sh5kyJF+MtZ5y6kwNhYzOsZcTZ3IHbYcv2S2f3U+U8JFJ4TIMWyqMKA6lf5+OsOn8/J7FTuDGX6KYQiPhE+MdoEWDfvlgo81MvYf1/4y6Akf4kyE6zSbj8WrvAhVweo+XI++iVAWlyA9WbE9MEt9+9v0aGFRGswEqIhZmdkUjAMSek6PC4Sphz6sjZQDUmUT//jF9F0nv0bYhca0oQWNiwmq3IOrl4QQM7reXzrhKhzHFRjJf4o8fYugq4AHbYDnsYNOJybGPYLWffoinufziSbI6aGhgk1ZmYM/BsRBLdEtP+yn1P0SKxl9N6Uid+eSshgj6plqMYYAi3ATpvrv+Ze8aFCaLndFHPM6V6G150bOAQW6U0nZDFM= andreszr@DESKTOP-3JVCFPR"
}

resource "aws_security_group" "ssh_connection" {
  name        = var.sg_name
  dynamic "ingress"{
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}