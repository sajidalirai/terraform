variable "instance_type" {
}

variable "elb_name" {
  type = string
}

variable "elb_azs" {
  type = list(string)
}