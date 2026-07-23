output "vpc_id" {
  description = "ID of the development VPC."
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block assigned to the development VPC."
  value       = module.vpc.vpc_cidr_block
}

output "availability_zones" {
  description = "Availability Zones used by the development VPC."
  value       = module.vpc.availability_zones
}

output "public_subnet_ids" {
  description = "IDs of the development public subnets."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the development private subnets."
  value       = module.vpc.private_subnet_ids
}

output "nat_gateway_public_ips" {
  description = "Public IP addresses assigned to development NAT gateways."
  value       = module.vpc.nat_gateway_public_ips
}
