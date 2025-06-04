# 🧩 Karpenter Terraform Module

This Terraform module installs and configures [Karpenter](https://karpenter.sh/) — an open-source Kubernetes autoscaler — using the official Helm chart. It integrates with the EKS cluster via IAM Roles for Service Accounts (IRSA) and is fully configurable via GitHub Actions environment secrets and variables.

---

## 📦 Features

- Installs **Karpenter via Helm**
- Uses **IRSA** for secure AWS access
- Supports **Spot and Graviton instance types**
- No hardcoded values — fully driven by GitHub environment variables and secrets

---

## 📁 Files

modules/karpenter/
├── main.tf # Helm release and Karpenter installation
├── variables.tf # Input variables
├── outputs.tf # Module outputs
├── README.md # This file


---

## 🔐 Required Variables

These are populated via GitHub Secrets/Variables:

| Variable                | Description                                      | Sensitive |
|-------------------------|--------------------------------------------------|-----------|
| `cluster_name`          | Name of the EKS cluster                          | No        |
| `cluster_endpoint`      | Cluster API endpoint                             | Yes       |
| `cluster_ca`            | Cluster CA certificate (base64-encoded)          | Yes       |
| `karpenter_role_arn`    | IAM role for Karpenter controller                | Yes       |
| `instance_profile_name` | Instance profile for nodes                       | No        |
| `interruption_queue_name` | Name of SQS queue for Spot interruptions      | No        |
| `karpenter_helm_version`| Helm chart version                               | No        |
| `karpenter_namespace`   | Namespace to deploy Karpenter                    | No        |

---

## 🎯 Outputs

| Output Name             | Description                           |
|-------------------------|---------------------------------------|
| `karpenter_namespace`   | Namespace where Karpenter is deployed |
| `karpenter_helm_release` | Helm release name                   |

---

## 🛠️ Usage

This module is invoked from the root `main.tf`:

```hcl
module "karpenter" {
  source              = "./modules/karpenter"
  cluster_name        = var.cluster_name
  cluster_endpoint    = var.cluster_endpoint
  cluster_ca          = var.cluster_ca
  karpenter_role_arn  = var.karpenter_role_arn
  instance_profile_name   = var.instance_profile_name
  interruption_queue_name = var.interruption_queue_name
  karpenter_helm_version  = var.karpenter_helm_version
}
