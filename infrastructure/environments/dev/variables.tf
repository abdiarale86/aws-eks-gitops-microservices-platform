variable "aws_region" {
  description = "AWS Region where development infrastructure will be deployed."
  type        = string
  default     = "ca-central-1"
}

variable "project_name" {
  description = "Name used when naming and tagging project resources."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string

  validation {
    condition     = var.environment == "dev"
    error_message = "The development root configuration requires environment to be dev."
  }
}

variable "vpc_cidr" {
  description = "IPv4 CIDR block assigned to the development VPC."
  type        = string
}

variable "az_count" {
  description = "Number of Availability Zones used by the development VPC."
  type        = number
}

variable "enable_nat_gateway" {
  description = "Whether NAT gateways are enabled."
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Whether private subnets share one NAT gateway."
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "Name of the development EKS cluster."
  type        = string
}

variable "tags" {
  description = "Additional tags applied to development resources."
  type        = map(string)
  default     = {}
}
