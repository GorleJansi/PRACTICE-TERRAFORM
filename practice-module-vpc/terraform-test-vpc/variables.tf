variable "project-m" {
    type = string
    default = "roboshop"
}

variable "env-m" {
    type = string
    default = "dev"
}

variable "igw-m" {
    type = string
    default = "igw"
}
variable "pub_cidr_block-m" {
    type = list
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "priv_cidr_block-m" {
    type = list
    default = ["10.0.3.0/24","10.0.4.0/24"]
}

variable "data_cidr_block-m" {
    type = list
    default = ["10.0.5.0/24","10.0.6.0/24"]
}


