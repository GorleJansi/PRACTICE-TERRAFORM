variable "ec2-names" {
    default = ['mongodb','redis','mysql','rabbitmq']
}

variable "ami"{
     default = "ami-01edba92f9036f76e"
}
variable "instance_type" { 
    default  = "t2.micro"
    }