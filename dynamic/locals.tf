locals {
  instance_name = "${var.project}-${var.environment}-ec2"
  sg_name = "${var.project}-${var.environment}-sg"
  common_tags = {
    env        = var.environment
    project    = var.project
    managed_by = "terraform"
  }

  sg_tags = merge(local.common_tags, {
    Name = local.sg_name
  })

  instance_tags = merge(local.common_tags, {
    Name = local.instance_name
  })
}

# variables = input values
# locals    = calculated/reused values
# dynamic   = repeated nested blocks