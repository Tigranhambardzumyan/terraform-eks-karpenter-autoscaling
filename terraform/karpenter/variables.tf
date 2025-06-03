variable "cluster_name" {
  description = "EKS cluster name to which Karpenter will connect"
  type        = string
}

variable "cluster_endpoint" {
  description = "EKS cluster endpoint for Karpenter to connect"
  type        = string
  sensitive   = true
}

variable "oidc_provider_arn" {
  description = "OIDC provider ARN used for IRSA"
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "List of private subnet IDs for Karpenter to provision nodes into"
  type        = list(string)
  sensitive   = true
}

variable "security_group_ids" {
  description = "Security group IDs for Karpenter provisioned instances"
  type        = list(string)
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to Karpenter resources"
  type        = map(string)
  default     = {}
}
