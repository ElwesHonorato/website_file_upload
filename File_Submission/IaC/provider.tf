provider "aws" {
  region  = var.region
}

terraform {
  backend "s3" {
    bucket = "terraformstate-filesubmission"
    key = "state/terraform.tfstate"
    region = "us-east-2"
  }
} 