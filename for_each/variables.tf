variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type    = string
  default = "ami-01edba92f9036f76e"
}

variable "domain" {
  type    = string
  default = "jansi.fun"
}

variable "hosted_zone_id" {
  type    = string
  default = "Z09439482Q9O4TJ24NLTV"
}

variable "security_group_id" {
  type    = string
  default = "sg-071d5e944b8c4d93f"
}



variable "ec2_names" {
  type    = map
  default = {
              "mongodb" = "t2.micro"
              "redis" = "t3.micro"
            }
}
