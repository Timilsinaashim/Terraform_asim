terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.56.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
  profile = "default"
}

module "vpc" {
    source = "./modules/vpc"


  
}
module "ec2" {
    source = "./modules/ec2"
    vpc_ID = module.vpc.vpc_ID
    public_subnet1 = module.vpc.public_subnet1
    public_subnet2 = module.vpc.public_subnet2
   private_subnet1 = module.vpc.private_subnet1
    private_subnet2 = module.vpc.private_subnet2
    private_subnet3 = module.vpc.private_subnet3
    private_subnet4 = module.vpc.private_subnet4
}

module "database" {
    source = "./modules/rds"
    vpc_ID = module.vpc.vpc_ID
    private_subnet3 = module.vpc.private_subnet3
    private_subnet4 = module.vpc.private_subnet4
    security_groups_id = module.ec2.security_groups_id
}

module "alb" {
    source = "./modules/alb"
    vpc_ID = module.vpc.vpc_ID
    public_subnet1 = module.vpc.public_subnet1
    public_subnet2 = module.vpc.public_subnet2
    security_groups_id = module.ec2.security_groups_id
    public-EC2-Instances1 = module.ec2.asim_1
    public-EC2-Instances2 = module.ec2.asim_2

}

module "asg" {
  source                  = "./modules/asg"
  subnet_id               = module.vpc.public_subnet1
  security_groups         = module.ec2.security_groups_id
  sg_name = module.ec2.sg_name
}