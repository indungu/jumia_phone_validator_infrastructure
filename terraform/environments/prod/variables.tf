variable "env" {
  description = "Deployment environment"
  default     = "prod"
}

variable "vpc_name" {
  description = "Name of the VPC"
  default     = "jumia"
}

variable "aws_region" {
  description = "AWS region in which to launch resources"
  default     = "eu-central-1"
}
