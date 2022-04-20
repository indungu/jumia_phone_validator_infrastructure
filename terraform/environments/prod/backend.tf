terraform {
  backend "s3" {
    bucket = "jumia-phone-validator"
    key    = "terraform/prod/terraform.tfstate"
    region = "eu-central-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.63.0"
    }
  }
}
