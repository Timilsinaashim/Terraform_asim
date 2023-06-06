resource "aws_db_instance" "default" {
  allocated_storage             = var.storage_class
#   db_name                       = "mydb"
  identifier             = var.identifier
  engine                        = var.engine
  engine_version                = var.engine_version
  instance_class                = var.instance_class
  username                      = "root"
  password                      = "new_password"
  parameter_group_name          = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.security_groups_id]
  db_subnet_group_name    = aws_db_subnet_group.mysql.name   # If this identifier is not specified then db is created in default VPC or in EC2 classic

  tags = {
    Name = "asim_mysql"
  }
}


resource "aws_db_subnet_group" "mysql" {
  name        = "asim_subnet_groups"
  description = "My database subnet group"
  subnet_ids  = [var.private_subnet3, var.private_subnet4]
  tags = {
    Name = "asim-subnet_group"
  }
}

# resource "aws_security_group" "rs-example-asim"{
#   name_prefix = "rds-db"
#   ingress {
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
