# 📘 Documentation Overview

This `info/` directory contains all supporting documentation for the [`terraform-eks-karpenter-autoscaling`](https://github.com/Tigranhambardzumyan/terraform-eks-karpenter-autoscaling) project.

Each subdirectory focuses on a specific aspect of the infrastructure, automation, or engineering decision-making process.

---

## 📂 Index of Guides

| Section                             | Description |
|-------------------------------------|-------------|
| [`branch-protection`](./branch-protection)                 | Describes branch protection rules, naming conventions, and required checks for pull requests. |
| [`cluster-access-setup`](./cluster-access-setup)           | Explains how to access the EKS cluster securely, including IAM roles and kubectl usage. |
| [`github-actions-runner`](./github-actions-runner)         | Contains diagrams and instructions for setting up a self-hosted GitHub Actions runner on AWS EC2. |
| [`karpenter-guide`](./karpenter-guide)                     | Comprehensive introduction to Karpenter: architecture, Helm deployment, and behavior. |
| [`karpenter-setup-notes`](./karpenter-setup-notes)         | Setup-specific notes and caveats while integrating Karpenter with EKS and Terraform. |
| [`karpenter-vs-nodegroup`](./karpenter-vs-nodegroup)       | Compares Karpenter with native EKS Managed Node Groups—use cases, benefits, and limitations. |
| [`pricing-notes`](./pricing-notes)                         | Notes on AWS pricing for Graviton, Spot, On-Demand, and cost optimization strategies. |
| [`terraform-module`](./terraform-module)                   | Details of the Terraform module structure and how the EKS/Karpenter provisioning works. |
| [`testing-strategy`](./testing-strategy)                   | How to test, validate, and QA the infrastructure with CI/CD and Kubernetes manifests. |

---

## 🔁 Updates

All documentation is regularly updated as the infrastructure evolves. Contributions and suggestions are welcome via pull requests.

---

## 🔗 Repository

Main repository: [terraform-eks-karpenter-autoscaling](https://github.com/Tigranhambardzumyan/terraform-eks-karpenter-autoscaling)
