variable "project" {
  type = string

}

variable "env" {
  type = string
}

variable "pub_cidr" {
  type = list(string)
}

variable "priv_cidr" {
  type = list(string)
}
