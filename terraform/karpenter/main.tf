# terraform-eks-karpenter-autoscaling

# Root module structure:
# ├── terraform/
# │   ├── main.tf
# │   ├── variables.tf
# │   ├── outputs.tf
# │   ├── karpenter/
# │   │   ├── main.tf
# │   │   ├── variables.tf
# │   │   └── outputs.tf
# │   ├── modules/
# │   │   ├── vpc/
# │   │   ├── eks/
# │   │   └── karpenter/
# ├── README.md

# terraform/modules/karpenter/main.tf

resource "helm_release" "karpenter" {
  name             = "karpenter"
  repository       = var.karpenter_helm_repo
  chart            = var.karpenter_helm_chart
  namespace        = var.karpenter_namespace
  create_namespace = true
  version          = var.karpenter_helm_version

  set {
    name  = "controller.clusterName"
    value = var.cluster_name
  }

  set {
    name  = "controller.clusterEndpoint"
    value = var.cluster_endpoint
  }

  set {
    name  = "controller.clusterCA"
    value = var.cluster_ca
  }

  set {
    name  = "serviceAccount.annotations.eks\.amazonaws\.com/role-arn"
    value = var.karpenter_role_arn
  }

  set {
    name  = "settings.aws.defaultInstanceProfile"
    value = var.instance_profile_name
  }

  set {
    name  = "settings.aws.interruptionQueueName"
    value = var.interruption_queue_name
  }

  depends_on = [
    kubernetes_namespace.karpenter
  ]
}

resource "kubernetes_namespace" "karpenter" {
  metadata {
    name = var.karpenter_namespace
  }
}

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

# terraform/modules/karpenter/outputs.tf

output "karpenter_namespace" {
  description = "Karpenter namespace"
  value       = var.karpenter_namespace
}

output "karpenter_helm_release" {
  description = "Karpenter Helm release name"
  value       = helm_release.karpenter.name
}
