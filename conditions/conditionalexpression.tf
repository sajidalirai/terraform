provider "aws" {
  
}

resource "aws_instance" "dev" {
    ami = "ami-002829755fa238bfa"
    instance_type = "t2.micro"
    count = var.istest == true ? 1 : 0
}

resource "aws_instance" "prod" {
    ami = "ami-002829755fa238bfa"
    instance_type = "t2.large"
    count = var.istest == false ? 1 : 0
}

variable "istest" {
  type = bool
  default = true
}