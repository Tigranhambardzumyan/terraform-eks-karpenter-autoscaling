# terraform-eks-karpenter-autoscaling

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
