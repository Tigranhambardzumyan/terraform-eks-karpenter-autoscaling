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
