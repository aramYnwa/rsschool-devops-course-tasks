terraform {
  backend "s3" {
    bucket  = "rsschool-terraform-state"
    key     = "state/terraform.tfstate"
    region  = var.aws_region
    encrypt = true             
  }
}
