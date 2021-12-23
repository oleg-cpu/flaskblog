provider "aws" {}

resource "aws_instance" "docker-host" {
  ami                    = "ami-0d527b8c289b4af7f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  user_data              = file("install_soft.sh")

  tags = {
    Name = "Docker Host "
  }
}

resource "aws_security_group" "allow_http_ssh" {
  name        = "Docker Host Security Group" 

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {

    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Docker Host Security Group "
  }
}