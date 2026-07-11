resource "aws_instance" "test1" {
    instance_type = "t2.micro"
    ami = "ami-01edba92f9036f76e"
    vpc_security_group_ids = ["sg-0708e7bc7b4f99963"]
    tags = {
        name = "test-terraform"
        env = "dev"
    }
}