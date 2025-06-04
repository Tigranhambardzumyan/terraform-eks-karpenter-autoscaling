# 🚀 EKS Cluster with Karpenter Autoscaling using Terraform

![Terraform](https://img.shields.io/badge/Terraform-1.6.6-blueviolet)
![GitHub Actions](https://img.shields.io/github/actions/workflow/status/Tigranhambardzumyan/terraform-eks-karpenter-autoscaling/deploy.yml?label=CI/CD)
![License](https://img.shields.io/github/license/Tigranhambardzumyan/terraform-eks-karpenter-autoscaling)

This repository provisions a production-ready **Amazon EKS cluster** with **Karpenter autoscaling**, leveraging **Graviton** and **Spot Instances** for cost-efficient compute — fully automated with **Terraform** and **GitHub Actions** (manual approval enabled for production).

---

## 🧩 Features

- 🛠️ Infrastructure-as-Code with **modular Terraform**
- 🚀 **Karpenter** auto-scaler with Helm (supports ARM64 and x86)
- 💸 Optimized with **Spot + Graviton** instance pools
- 🔐 Uses **GitHub Secrets & Variables** — no hardcoded values
- 🧪 Integrated CI/CD pipeline with GitHub Actions and approvals
- 🧭 Informational sub-guides on setup, testing, pricing, and more

---

## 📁 Directory Overview

```
.
├── .github/workflows          # GitHub Actions deployment workflow
├── info/                      # Setup notes, strategy, architecture guides
├── kubernetes/                # Sample Kubernetes manifests (x86, graviton)
├── scripts/                   # Helper scripts (cleanup, validation)
├── terraform/                 # Main Terraform configuration
│   └── modules/
│       └── karpenter/         # Helm-based Karpenter module
├── README.md                  # You're here!
```

---

## 🔐 GitHub Secrets & Variables

This project relies on **GitHub Environments** with the following keys:

### 🧪 Secrets (sensitive values)
- `TF_VARS_AWS_REGION`
- `TF_VARS_CLUSTER_ENDPOINT`
- `TF_VARS_OIDC_PROVIDER_ARN`
- `TF_VARS_KARPENTER_ROLE_ARN`
- `TF_VARS_PRIVATE_SUBNETS`
- `TF_VARS_SECURITY_GROUP_IDS`
- `TF_VARS_PROJECT_TAG`

### ⚙️ Variables (non-sensitive)
- `TERRAFORM_VERSION`
- `TF_VARS_CLUSTER_NAME`
- `TF_VARS_CLUSTER_VERSION`
- `TF_VARS_AVAILABILITY_ZONES`
- `TF_VARS_VPC_CIDR`
- `TF_VARS_VPC_NAME`
- `TF_VARS_PUBLIC_SUBNETS`

All referenced in `terraform/variables.tf` and injected via the CI/CD pipeline.

---

## 🚀 Deployment

You can deploy the infrastructure manually via GitHub Actions UI:

```bash
GitHub → Actions → "EKS Infrastructure Provisioning with Terraform and Karpenter" → Run workflow
```

You'll be prompted to choose the environment (`Development` or `Production`).

✅ Production requires **manual approval** via GitHub Environment protection.

---

## 🧰 Terraform CLI (Local Usage)

```bash
cd terraform/

terraform init

terraform plan   -var="cluster_name=..."   -var="cluster_endpoint=..."   ...

terraform apply -auto-approve
```

> ⚠️ Avoid CLI deployments for production unless for debugging. Use CI/CD instead.

---

## 📦 Outputs

The following values are exported after apply:

- `cluster_name`
- `vpc_id`
- `eks_cluster_endpoint`
- `eks_cluster_version`
- `karpenter_irsa_arn`

They are stored as CI artifacts and can be reused across modules.

---

## 📚 Documentation

- [`info/`](./info/) – Architecture notes, testing, pricing analysis
- [`kubernetes/`](./kubernetes/) – Deployment examples for ARM64 (Graviton) and x86 workloads
- [`terraform/`](./terraform/) – Main IaC logic

---

## 📌 Notes

- Uses the latest stable EKS version (via input var)
- Karpenter deployed via Helm
- IAM roles for Karpenter and workers use IRSA (OIDC)
- Spot instance management via interruption queue
- Optimized for multi-AZ deployments

---

## 📝 License

This project is licensed under the MIT License — see the [LICENSE](./LICENSE) file for details.