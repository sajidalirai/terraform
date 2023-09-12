resource "aws_instance" "test" {
    ami = "ami-002829755fa238bfa"
    instance_type = "t2.micro"
    count = 3

    tags = {
        Name = "test${count.index}"
    }
}
