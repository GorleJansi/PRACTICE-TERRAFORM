# outputs.tf is used to print useful values after Terraform creates or updates infrastructure.
# Outputs are also stored in Terraform state, so avoid outputting secrets here.
# This output is named `test-op1`.
# You can read it with `terraform output test-op1` after `terraform apply`.

# output "test-op1" {
    
#    value = aws_instance.test1-EC2  # `value` decides what Terraform should print for this output.

   
#     description = "all attribute values of test1-EC2"  # `description` explains the purpose of this output to humans.
# }


