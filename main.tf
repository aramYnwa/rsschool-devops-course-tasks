terraform {
  backend "s3" {
    bucket  = "rsschool-terraform-state"
    key     = "state/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true             
  }
}
