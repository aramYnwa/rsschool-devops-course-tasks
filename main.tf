terraform {
  backend "s3" {
    bucket  = "rsschool-terraform-state" # Replace with your bucket name
    key     = "state/terraform.tfstate"  # File path to store state in the bucket
    region  = "eu-central-1"             # Replace with your bucket's region
    encrypt = true                       # Encrypt state file at rest
  }
}
