
# Karpenter Guide for EKS Auto-Scaling

This document explains how Karpenter is configured in the `terraform-eks-karpenter-autoscaling` project to provide dynamic, architecture-aware autoscaling for an EKS cluster on AWS.

---

## 🔧 What is Karpenter?

Karpenter is an open-source Kubernetes autoscaler built by AWS that launches right-sized EC2 instances based on the requirements of unscheduled pods.

Unlike EKS Managed Node Groups, Karpenter doesn't require predefining node groups and can scale across instance families, architectures (x86_64 and arm64), and spot/on-demand pricing.

---

## 🏗️ What This Terraform Setup Does

- Provisions an EKS cluster in a dedicated VPC using the AWS Terraform module
- Creates IAM resources for Karpenter (IRSA)
- Installs Karpenter via Helm
- Configures `Provisioners` to:
  - Dynamically launch EC2 nodes (x86_64 and arm64)
  - Use Spot instances for cost savings
  - Auto-label nodes and use taints to control scheduling

---

## 📂 Module: `karpenter/`

Files:
- `karpenter.tf` – Helm chart, controller config, and provisioners
- `iam.tf` – IAM Role for Service Account (IRSA) for Karpenter controller

---

## 🧠 How Karpenter Works Here

1. **Helm Chart Install**
   - The Helm chart is installed into the `karpenter` namespace
   - IRSA is used for the controller pod to access EC2, pricing, and ASG APIs

2. **Provisioners**
   - Defined for both x86_64 and arm64 workloads
   - `consolidation` is enabled to replace smaller nodes with fewer bigger ones
   - Use labels or node selectors to route workloads to Graviton (arm64)

3. **IAM Permissions**
   - Karpenter gets:
     - `ec2:RunInstances`
     - `ec2:DescribeInstanceTypes`
     - `pricing:GetProducts`
     - `autoscaling:TerminateInstanceInAutoScalingGroup` (optional)

---

## 📌 Example Usage (Developer)

To schedule a pod on a Graviton instance:

```yaml
spec:
  nodeSelector:
    kubernetes.io/arch: arm64
```

To target x86_64:

```yaml
spec:
  nodeSelector:
    kubernetes.io/arch: amd64
```

---

## 🔒 Security

- Uses IAM Roles for Service Accounts (IRSA)
- Terraform ensures the role is only assumed by the `karpenter` service account
- Helm values are pinned to a specific version for reproducibility

---

## 🛠 Future Ideas

- Add `consolidationPolicy: WhenUnderutilized`
- Implement taints/tolerations for finer control
- Add cost optimization logic with priority/weights per instance type

---
