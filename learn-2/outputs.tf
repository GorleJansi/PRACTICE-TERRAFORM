output "learn2-op" {

    value = aws_instance.learn2[*]-ec2.private_ip    
    # value ={
    #     for index,instance in aws_instance.learn2-ec2 :
    #        var.ec2-names[index] => instance.private_ip
    }
}