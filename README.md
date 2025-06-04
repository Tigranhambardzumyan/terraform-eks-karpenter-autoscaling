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
=======
## 🚀 Overview

This repository provides a complete Terraform-based solution for provisioning an AWS EKS cluster integrated with Karpenter for dynamic autoscaling. It includes configurations to:

* Deploy a dedicated VPC and EKS cluster
* Set up Karpenter using IRSA and Helm
* Utilize Graviton and Spot instances
* Deploy using GitHub Actions with environment-specific secrets and variables

---

## 🛠️ Architecture Summary

* **AWS VPC**: Custom CIDR block, public and private subnets across AZs
* **EKS Cluster**: Managed node groups with IRSA enabled
* **Karpenter**: Provisioned using Helm, IAM roles and SQS queue
* **GitHub Actions**: Manual CI/CD pipeline with Terraform plan/apply per environment

---

## 📁 Directory Layout

```text
├── .github/workflows/         # GitHub Actions CI/CD workflows
├── info/                      # Documentation and references
├── kubernetes/                # Sample manifests for workload testing
├── scripts/                   # Helper shell scripts
├── terraform/                 # Main Terraform config
│   ├── main.tf                # Root module
│   ├── variables.tf           # Input variables
│   ├── outputs.tf             # Outputs
│   ├── providers.tf           # Provider configuration
│   └── modules/karpenter/     # Karpenter Helm module
└── README.md                  # Root README (this file)
```

---

## 📦 How to Deploy

### 1. 📥 Clone the Repo

```bash
git clone https://github.com/Tigranhambardzumyan/terraform-eks-karpenter-autoscaling.git
cd terraform-eks-karpenter-autoscaling
```

### 2. ✅ Configure GitHub Secrets & Variables

* Populate all required secrets and vars for both environments (dev/prod)
* Secrets include subnet IDs, cluster endpoint, OIDC, IRSA role, etc.
* Variables include Terraform version, VPC CIDR, AZs, etc.

### 3. 🚀 Deploy with GitHub Actions

Go to **Actions** tab → run the workflow manually → choose `Development` or `Production` environment.

---

## 🧪 Testing

You can apply test deployments from the `kubernetes/` directory:

* `graviton-deployment.yaml`
* `x86-deployment.yaml`

These help verify Karpenter's ability to schedule based on architecture.

---

## 📚 Related Docs

Additional info is available in the `info/` directory:

* Karpenter vs NodeGroup strategies
* Cost/pricing notes
* Cluster access configuration
* Testing strategy and scripts

---

## 🤝 Contributing

Pull requests are welcome. Please submit issues if you find bugs or missing configurations.

---

## 📄 License

[MIT](LICENSE)
