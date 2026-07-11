
variable "vpc" {
  type    = string
  default = "vpc-049e1b4cf91a0f585"
}

variable "ami" {
  type    = string
  default = "ami-01edba92f9036f76e"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "project" {
  type    = string
  default = "roboshop"
}


