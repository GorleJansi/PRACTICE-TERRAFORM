locals {

  tags = {
        Name = "${var.project}-${var.env}"
        project = "multienv"
        terraform = "true"
        env = var.env

    }  
}

