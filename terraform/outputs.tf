output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = var.cluster_name
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_version" {
  description = "Kubernetes version of the EKS cluster"
  value       = module.eks.cluster_version
}

output "karpenter_irsa_arn" {
  description = "IAM Role ARN used by Karpenter (via IRSA)"
  value       = module.karpenter.irsa_arn
}