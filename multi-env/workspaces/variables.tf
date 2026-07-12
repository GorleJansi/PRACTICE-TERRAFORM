variable "ami" {
  type    = string
  default = "ami-01edba92f9036f76e"
}

variable "sg" {
  type    = string
  default = "sg-0708e7bc7b4f99963"
}

variable "instance_type" {
  type = map(string)
  default = {
    default = "t2.micro"
    dev     = "t2.micro"
    prod    = "t3.micro"
  }
}

variable "vpc" {
  type    = string
  default = "vpc-049e1b4cf91a0f585"
}

variable "project" {
  type    = string
  default = "multienv"
}
