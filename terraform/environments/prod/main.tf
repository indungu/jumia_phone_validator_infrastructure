provider "aws" {
  region = var.aws_region
}

module "prod_vpc" {
  source = "../../modules/vpc"

  env      = var.env
  vpc_name = "${var.env}-vpc"
}
