# VPC Configuration
variable "env" {
  description = "Deployment environment"
  default = "dev"
}

variable "vpc_name" {
  description = "Name of the VPC resources will be deployed to."
  default     = "jumia"
}

variable "aws_region" {
  description = "AWS Region resources will be launched in."
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "Network CIDR range for VPC."
  default     = "172.12.0.0/16"
}

variable "public_subnets_cirds" {
  description = "Network CIDRs for public subnets in VPC"
  default     = ["172.12.1.0/24", "172.12.2.0/24", "172.12.3.0/24"]
}

variable "private_subnets_cirds" {
  description = "Network CIDRs for private subnets in VPC"
  default     = ["172.12.4.0/24", "172.12.5.0/24", "172.12.6.0/24"]
}

variable "azs" {
  description = "VPC availability zones"
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

variable "enable_dns_hostnames" {
  default = true
}

variable "enable_dns_support" {
  default = true
}

variable "enable_nat_gateway" {
  default = true
}

variable "single_nat_gateway" {
  default = false
}

variable "one_nat_gateway_per_az" {
  default = true
}

variable "reuse_nat_ips" {
  default = true
}
