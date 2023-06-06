variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "vpc cidrblock"

}

variable "subnet_id1" {
  default = "10.0.1.0/24"
}

variable "subnet_id2" {
  default = "10.0.2.0/24"
}

variable "privatesubnet_id1" {
  default = "10.0.3.0/24"
}

variable "privatesubnet_id2" {
  default = "10.0.4.0/24"
}

variable "privatesubnet_id3" {
  default = "10.0.5.0/24"
}

variable "privatesubnet_id4" {
  default = "10.0.6.0/24"
}



