variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

variable "cluster_endpoint" {
  description = "Endpoint URL for the EKS cluster"
  type        = string
  sensitive   = true
}

variable "oidc_provider_arn" {
  description = "OIDC provider ARN for IRSA"
  type        = string
  sensitive   = true
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  sensitive   = true
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  sensitive   = true
}

variable "security_group_ids" {
  description = "List of security group IDs for worker nodes"
  type        = list(string)
  sensitive   = true
}

variable "project_tag" {
  description = "Project tag for resource identification"
  type        = string
}
