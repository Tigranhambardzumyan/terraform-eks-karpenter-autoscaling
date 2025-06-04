# Karpenter Terraform Module

This module installs and configures the [Karpenter](https://karpenter.sh) autoscaler on your Amazon EKS cluster using the Helm provider in Terraform.

## ❗Purpose

Karpenter dynamically provisions EC2 instances based on the scheduling needs of your cluster, supporting both x86 and ARM (Graviton) architectures, including Spot and On-Demand nodes.

This module integrates with your existing EKS cluster, IRSA (IAM Roles for Service Accounts), and CI/CD pipelines via GitHub Actions.

---

## 📁 Module Structure

```bash
terraform/modules/karpenter/
├── main.tf         # Helm chart installation logic
├── variables.tf    # Required inputs
├── outputs.tf      # Useful outputs like release name, namespace
