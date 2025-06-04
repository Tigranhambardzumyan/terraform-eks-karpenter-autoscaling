# Pricing Notes for EKS + Karpenter

This document summarizes the key pricing considerations for deploying an EKS cluster with Karpenter.

## 1. EKS Control Plane Costs

* ~~\$0.10/hour per cluster (~~\$72/month)

## 2. Worker Node Costs

* **Karpenter** allows dynamic use of:

  * **On-Demand Instances** (standard rates)
  * **Spot Instances** (up to 90% savings)
  * **Graviton2/3 (ARM)** (up to 20% lower than x86)

## 3. Karpenter-Specific Costs

* No extra charge for Karpenter
* Associated with underlying compute, IAM, and SQS usage

## 4. Additional AWS Services

* **SQS Interruption Queue**: minimal cost
* **IAM Roles**: free
* **EBS volumes**: storage pricing applies per GB

## 5. GitHub Actions (CI/CD)

* Self-hosted runners reduce cost but require EC2 capacity
* Secrets management and artifact storage within GitHub are free within usage tier

## Tips

* Use spot instance limits and diversification to avoid interruptions
* Leverage Graviton where workloads allow ARM compatibility
* Monitor costs using AWS Cost Explorer and tags (e.g., `Project=karpenter-demo`)
