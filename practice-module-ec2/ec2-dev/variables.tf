variable "ami" {
     type = string
     default = "ami-01edba92f9036f76e"
}
variable "instance_type"{
  type = string
  default = "t2.micro"
}

variable "sg"{
  type = list
  default = ["sg-0708e7bc7b4f99963"]
}

variable "tags" {
    type = map
    default ={ 
        Name = "ec2-mod-test"
        terraform = "true"
        env = "dev"

    }
}