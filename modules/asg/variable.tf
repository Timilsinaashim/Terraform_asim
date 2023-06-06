variable "image-id" {
  description = "The ID of the Amazon Machine Image (AMI) to use"
  type        = string
  default     = "ami-024e6efaf93d85776"
}

variable "instance-type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "key-name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
  default     = "forvpc"
}

variable "security_groups" {
  default = ""
}

variable "max_size" {
  description = "The maximum size of the Auto Scaling Group"
  type        = number
  default     = 5
}

variable "min_size" {
  description = "The minimum size of the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "The desired capacity of the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "subnet_id" {
  default = ""
}

variable "sg_name" {
  default = ""
  
}

