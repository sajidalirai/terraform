provider "aws" {
    alias = "reference"
  
}

resource "aws_instance" "web" {
    ami = "ami-002829755fa238bfa"
    instance_type = "t2.micro"
}

resource "aws_eip" "lb1" {
    provider = aws.reference
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.lb1.id
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TCP inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.lb1.public_ip}/32"]
  }

  tags = {
    Name = "allow_tls"
  }
}