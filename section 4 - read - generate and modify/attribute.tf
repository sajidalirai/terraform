
resource "aws_eip" "lb" {
  
}

output "eip" {
  value = aws_eip.lb.public_ip
}


resource "aws_s3_bucket" "mys3" {
  bucket = "s3-bucket-created-using-terraform"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3
}