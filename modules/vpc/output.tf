output "vpc_ID" {
  value = aws_vpc.demo-vpc.id

}

output "public_subnet1" {
  value = aws_subnet.demo-subnet1.id
}

output "public_subnet2" {
  value = aws_subnet.demo-subnet2.id
}

output "private_subnet1" {
  value = aws_subnet.demo-privatesubnet1.id
}

output "private_subnet2" {
  value = aws_subnet.demo-privatesubnet2.id
}

output "private_subnet3" {
  value = aws_subnet.demo-privatesubnet3.id
}

output "private_subnet4" {
  value = aws_subnet.demo-privatesubnet4.id
}
