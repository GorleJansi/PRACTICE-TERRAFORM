variable "env" {
    type = string
    description = "environment "

    validation {
        condition = contains(["dev","prod","qa"], var.env)
        error_message = "environment should dev,prod,or qa"
    }
}