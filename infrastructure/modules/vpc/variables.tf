variable "project_name" {
  description = "Name of the project. Used when naming and tagging AWS resources."
  type        = string

  validation {
    condition     = length(trimspace(var.project_name)) > 0
    error_message = "project_name must not be empty."
  }
}

variable "environment" {
  description = "Deployment environment. Supported values are dev and prod."
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "environment must be either dev or prod."
  }
}

variable "vpc_cidr" {
  description = "IPv4 /16 CIDR block assigned to the VPC."
  type        = string

  validation {
    condition = (
      can(cidrnetmask(var.vpc_cidr)) &&
      can(regex("/16$", var.vpc_cidr))
    )

    error_message = "vpc_cidr must be a valid IPv4 /16 CIDR block, such as 10.10.0.0/16."
  }
}

variable "az_count" {
  description = "Number of Availability Zones used by the VPC."
  type        = number

  validation {
    condition = (
      var.az_count == floor(var.az_count) &&
      var.az_count >= 2 &&
      var.az_count <= 3
    )

    error_message = "az_count must be either 2 or 3."
  }
}

variable "enable_nat_gateway" {
  description = "Whether NAT gateways should be created for private subnet internet access."
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Whether all private subnets should share one NAT gateway. Set false to create one NAT gateway per Availability Zone."
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "Name of the EKS cluster that will use the VPC subnets."
  type        = string

  validation {
    condition     = length(trimspace(var.cluster_name)) > 0
    error_message = "cluster_name must not be empty."
  }
}

variable "tags" {
  description = "Additional tags to apply to resources created by the VPC module."
  type        = map(string)
  default     = {}
}
