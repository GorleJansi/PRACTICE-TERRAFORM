variable "ec2_names" {
  default = {
    mongodb  = "t3.micro"
    redis    = "t2.micro"
    mysql    = "t3.small"
    rabbitmq = "t2.micro"
  }
}

variable "sg" {
  default = "sg-071d5e944b8c4d93f"
}
variable "vpc" {
  default = "vpc-049e1b4cf91a0f585"
}
