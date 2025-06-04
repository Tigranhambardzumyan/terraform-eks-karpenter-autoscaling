# ☁️ Terraform AWS EKS + Karpenter Infrastructure

This directory defines the core infrastructure for deploying an EKS cluster on AWS with Karpenter autoscaling support. It uses reusable modules and GitHub Actions for CI/CD deployment.

---

## 📁 Structure

terraform/
├── main.tf # Root composition: VPC, EKS, Karpenter module
├── variables.tf # Input variables passed via GitHub Secrets/Variables
├── outputs.tf # Cluster name and Karpenter IRSA output
├── providers.tf # AWS provider config
├── modules/
│ └── karpenter/ # Custom Helm-based module to install Karpenter
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── README.md


---

## 🚀 What It Does

- **Creates a new VPC** with public/private subnets across 3 AZs
- **Deploys an EKS cluster** (latest version) using Terraform AWS modules
- **Installs Karpenter** via a custom Helm module
- Supports both **x86 and Graviton (arm64)** architectures using Spot and On-Demand provisioning
- Integrated with **GitHub Actions** CI/CD using environment-based secrets and variables

---

## 🔐 Configuration

No hardcoded values. All parameters are provided through **GitHub Environment Variables and Secrets**, including:

- Cluster name, version, region
- Subnets, security groups, OIDC/IAM roles
- Karpenter Helm config

---

## 📦 Outputs

After deployment, the following outputs are available:

- `cluster_name` – EKS cluster name
- `karpenter_irsa_arn` – IAM Role for Service Account (IRSA) used by Karpenter

---

## 📂 Karpenter Module

See [`modules/karpenter/`](modules/karpenter/) for Helm deployment logic and configuration for the Karpenter controller.

---

## ⚙️ Apply via GitHub Actions

Deployment is triggered through [workflow_dispatch] using:

- Environment: `Development` or `Production`
- Secrets/vars set in GitHub Environments

Manual triggers ensure approval protection in production.

---

## 📚 Related Docs

- [`info/terraform-module`](../info/terraform-module) – Additional module usage and design
- [`info/github-actions-runner`](../info/github-actions-runner) – CI/CD setup and runner configuration
