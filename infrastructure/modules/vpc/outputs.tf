output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "IPv4 CIDR block assigned to the VPC."
  value       = aws_vpc.this.cidr_block
}

output "availability_zones" {
  description = "Availability Zones selected for the VPC."
  value       = local.selected_availability_zones
}

output "public_subnet_ids" {
  description = "IDs of the public subnets in Availability Zone order."
  value = [
    for az in local.selected_availability_zones :
    aws_subnet.public[az].id
  ]
}

output "private_subnet_ids" {
  description = "IDs of the private subnets in Availability Zone order."
  value = [
    for az in local.selected_availability_zones :
    aws_subnet.private[az].id
  ]
}

output "public_subnet_cidr_blocks" {
  description = "CIDR blocks assigned to the public subnets."
  value = [
    for az in local.selected_availability_zones :
    aws_subnet.public[az].cidr_block
  ]
}

output "private_subnet_cidr_blocks" {
  description = "CIDR blocks assigned to the private subnets."
  value = [
    for az in local.selected_availability_zones :
    aws_subnet.private[az].cidr_block
  ]
}

output "internet_gateway_id" {
  description = "ID of the internet gateway attached to the VPC."
  value       = aws_internet_gateway.this.id
}

output "nat_gateway_ids" {
  description = "IDs of the NAT gateways created by the module. Returns an empty list when NAT gateways are disabled."
  value = [
    for key in sort(keys(aws_nat_gateway.this)) :
    aws_nat_gateway.this[key].id
  ]
}

output "nat_gateway_public_ips" {
  description = "Public Elastic IP addresses assigned to the NAT gateways. Returns an empty list when NAT gateways are disabled."
  value = [
    for key in sort(keys(aws_nat_gateway.this)) :
    aws_nat_gateway.this[key].public_ip
  ]
}

output "public_route_table_id" {
  description = "ID of the route table associated with the public subnets."
  value       = aws_route_table.public.id
}

output "private_route_table_ids" {
  description = "IDs of the route tables associated with the private subnets."
  value = [
    for az in local.selected_availability_zones :
    aws_route_table.private[az].id
  ]
}
