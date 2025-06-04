# Project Overview: EKS + Karpenter Autoscaling on AWS

This repository provides a complete Infrastructure as Code solution to deploy a production-ready EKS cluster with:

- **Karpenter** for autoscaling
- **Graviton** and **Spot** instance support
- GitHub Actions CI/CD using **Environments**, **Secrets**, and **Self-hosted runners**

## Architecture Highlights

- **Terraform Modules**:
  - VPC: Amazon VPC with NAT Gateway and public/private subnets
  - EKS: Configurable Kubernetes cluster with IRSA and node groups
  - Karpenter: Helm-based install with IAM + controller provisioning

- **GitHub Actions**:
  - Fully automated deployment pipelines for `development` and `production`
  - Runs on AWS-hosted self-hosted runners
  - Separate environments with approval gates for production

## Deployment Targets

| Branch       | GitHub Environment | AWS Environment |
|--------------|--------------------|------------------|
| `development`| Development         | karpenter-dev    |
| `master`     | Production          | karpenter-prod   |

## Getting Started

1. Clone the repository.
2. Configure GitHub Secrets and Variables per environment.

