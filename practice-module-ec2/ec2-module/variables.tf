variable "ami" {
     type = string
     description = "ami id of the ec2 to be created"

}
variable "instance_type"{
  type = string
  description = " Mandatory: instance_type of the ec2 to be created"

}

variable "sg"{
  type = list
  description = " Mandatory: security group of the ec2 to be created"

}

variable "tags" {
    type = map
    default ={}
    description = "optional : tags of the ec2 to be created"
}