provider "aws" { 
}

resource "aws_instance" "web" {
    ami = "ami-002829755fa238bfa"
    instance_type = "t2.micro"
}