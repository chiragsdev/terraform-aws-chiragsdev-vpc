output "vpc_id" {
  value = module.my_vpc.vpc_id
}

output "public_subnet" {
  value = module.my_vpc.public_subnets
}

output "private_subnet_subnet" {
  value = module.my_vpc.private_subnets
}