output "asim_1" {
    value = aws_instance.EC2-Instances1.id
}

output "asim_2" {
    value = aws_instance.EC2-Instances2.id
  
}

output "security_groups_id" {
  value = aws_security_group.demo-sg.id
}

output "sg_name" {
  value = aws_security_group.demo-sg.id
  
}