provider "aws" {
  region = var.aws_region
}

locals {
  tags = {
    Terraform = "true"
    Environment = var.env
  }
}

resource "aws_eip" "nat" {
  count = 3

  vpc = true
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  # VPC name and network scope
  name = var.vpc_name
  cidr = var.vpc_cidr

  # Availability zones and subnets
  azs             = var.azs
  public_subnets  = var.public_subnets_cirds
  private_subnets = var.private_subnets_cirds

  # DNS settings
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  # NAT Gateway configuration
  enable_nat_gateway  = var.enable_nat_gateway
  single_nat_gateway  = var.single_nat_gateway
  reuse_nat_ips       = var.reuse_nat_ips
  external_nat_ip_ids = "${aws_eip.nat.*.id}"

  tags = local.tags
}
