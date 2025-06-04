# Terraform EKS Cluster with Karpenter Autoscaling

This module sets up an EKS cluster with support for Karpenter autoscaling, Graviton and Spot instance provisioning.

## Structure

terraform/
├── main.tf # Root module to deploy VPC, EKS, and Karpenter modules
├── variables.tf # Input variables (used via GitHub Variables/Secrets)
├── outputs.tf # Exports useful values like cluster name
├── providers.tf # AWS provider config
├── karpenter/ # Karpenter module
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf


## How it Works

- Values like region, subnets, and cluster config are injected from GitHub Secrets and Variables.
- EKS is deployed with the latest supported version.
- Karpenter is installed via Helm and configured using IRSA.
- Supports dynamic provisioning of both x86 and ARM nodes via Karpenter Provisioners (manually added post-deployment).
- Designed for CI/CD with GitHub Actions and environment-based isolation (`Production` and `Development`).

## Requirements

- GitHub repository with:
  - Environments `Production` and `Development` configured.
  - All variables and secrets declared in GitHub Environments.
- AWS IAM role for GitHub Runner.
- A self-hosted runner attached to your repository.

## CI/CD

All deployments are handled by `.github/workflows/deploy.yml`:
- Push to `development` → triggers deploy to Development environment.
- Push to `master` → triggers deploy to Production with approval.

## Cleanup

To remove infrastructure:

```bash
terraform destroy -var="..."  # Secrets/vars injected automatically in CI

