# Insatance-1
resource "aws_instance" "EC2-Instances1" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = var.ec2_keypair
  associate_public_ip_address = true 
  availability_zone = "us-east-2a"
  subnet_id              = var.public_subnet1
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  tags = {
    Name = "asim-2a"
  }

}

# Instance-2
resource "aws_instance" "EC2-Instances2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = var.ec2_keypair
  associate_public_ip_address = true 
  availability_zone = "us-east-2b"
  subnet_id              = var.public_subnet2
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  tags = {
    Name = "asim-2b"
  }

}
#Instance-1private 
resource "aws_instance" "private-EC2-Instances1" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = var.ec2_keypair
  associate_public_ip_address = true 
  availability_zone = "us-east-2a"
  subnet_id              = var.private_subnet1
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  tags = {
    Name = "asim-private1"
  }

}

#Instance-2private 
resource "aws_instance" "private-EC2-Instances2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = var.ec2_keypair
  associate_public_ip_address = true 
  availability_zone = "us-east-2b"
  subnet_id              = var.private_subnet2
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  tags = {
    Name = "asim-private2"
  }

}
#Instance-3private 
resource "aws_instance" "private-EC2-Instances3" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = var.ec2_keypair
  associate_public_ip_address = true 
  availability_zone = "us-east-2a"
  subnet_id              = var.private_subnet3
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  tags = {
    Name = "asim-private3"
  }

}

#Instance-4private 
resource "aws_instance" "private-EC2-Instances4"{
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = var.ec2_keypair
  associate_public_ip_address = true 
  availability_zone = "us-east-2b"
  subnet_id              = var.private_subnet4
  vpc_security_group_ids = [aws_security_group.demo-sg.id]
  tags = {
    Name = "asim-private4"
  }

}


#create a security group

resource "aws_security_group" "demo-sg" {
  name   = "demo-sg"
  vpc_id = var.vpc_ID

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
    ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
