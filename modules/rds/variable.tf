variable "instance_class" {
    type = string
    default = "db.t2.micro"
    description = "types os storage class"  
}

variable "storage_class" {
    type = number
    default = 10
    description = "storage type"
}

variable "engine" {
    type = string
    default = "mysql"
    description = "Engine type for the RDS"
}

variable "engine_version" {
    type = number
    default = "5.7"
    description = "engine type for rds"
}

variable "identifier" {
  default = "mysqldb"  
}


variable "private_subnet3"{}
variable "private_subnet4"{}
variable "security_groups_id" {}
variable "vpc_ID" {}
