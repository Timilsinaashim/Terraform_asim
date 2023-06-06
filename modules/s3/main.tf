resource "aws_s3_bucket" "asim_s3_terraform" {
  bucket = "asim-terraform-bucket17"

  tags = {
    Name        = "asim-terraform-bucket17"
    Environment = "dev-production"
  }
}

