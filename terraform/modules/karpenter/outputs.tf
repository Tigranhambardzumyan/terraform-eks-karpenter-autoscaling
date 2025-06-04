# terraform/modules/karpenter/outputs.tf

output "karpenter_namespace" {
  description = "Karpenter namespace"
  value       = var.karpenter_namespace
}

output "karpenter_helm_release" {
  description = "Karpenter Helm release name"
  value       = helm_release.karpenter.name
}
