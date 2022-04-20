output "vpc_id" {
  value = module.prod_vpc.vpc_id
}

output "private_subnets" {
  value = module.prod_vpc.private_subnets
}

output "public_subnets" {
  value = module.prod_vpc.public_subnets
}
