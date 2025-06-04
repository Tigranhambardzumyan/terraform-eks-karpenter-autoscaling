# terraform/modules/karpenter/variables.tf

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_endpoint" {
  description = "EKS cluster endpoint"
  type        = string
  sensitive   = true
}

variable "cluster_ca" {
  description = "Base64 encoded EKS cluster CA"
  type        = string
  sensitive   = true
}

variable "karpenter_role_arn" {
  description = "IAM role ARN for Karpenter controller"
  type        = string
  sensitive   = true
}

variable "instance_profile_name" {
  description = "IAM instance profile name for Karpenter provisioned nodes"
  type        = string
}

variable "interruption_queue_name" {
  description = "SQS queue name for interruption handling"
  type        = string
}

variable "karpenter_helm_repo" {
  description = "Helm repository URL for Karpenter"
  type        = string
  default     = "https://charts.karpenter.sh"
}

variable "karpenter_helm_chart" {
  description = "Helm chart name for Karpenter"
  type        = string
  default     = "karpenter"
}

variable "karpenter_helm_version" {
  description = "Karpenter Helm chart version"
  type        = string
}

variable "karpenter_namespace" {
  description = "Namespace where Karpenter will be installed"
  type        = string
  default     = "karpenter"
}