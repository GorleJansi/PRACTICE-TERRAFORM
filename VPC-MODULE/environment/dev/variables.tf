variable "project-m" {
  type    = string
  default = "roboshop"
}

variable "env-m" {
  type    = string
  default = "dev"
}

variable "pub_cidr-m" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "priv_cidr-m" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}
