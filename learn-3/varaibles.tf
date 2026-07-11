variable "ec2_names" {
    default = {
    mongodb  = "t3.micro"
    redis    = "t2.micro"
    mysql    = "t3.small"
    rabbitmq = "t2.micro"
   }
}

variable "sg-id" {
    default = "sg-071d5e944b8c4d93f"
}

variable "ami"{
     default = "ami-01edba92f9036f76e"
}

variable "domain" {
  type    = string
  default = "jansi.fun"
}

variable "zone_id" {
  type    = string
  default = "Z09439482Q9O4TJ24NLTV"
}

