# GitHub Actions: EKS Infrastructure CI/CD

This directory contains workflows for provisioning AWS EKS infrastructure using Terraform and Karpenter via GitHub Actions.

## 📂 Workflow Summary

* **File:** `.github/workflows/deploy.yml`
* **Trigger:** Manual (`workflow_dispatch`) with selectable environment (Development or Production)
* **Runner:** Self-hosted EC2 instance with labels: `self-hosted`, `terraform`
* **Tooling:** Uses `hashicorp/setup-terraform` for installation

## ✅ Features

* Secure secrets/variables via GitHub Actions Environment settings
* Terraform plan and apply steps
* Conditional apply on `master` or `development` branches
* Uploads Terraform output as build artifact

## 🔐 Environments

* GitHub Environments (`Development`, `Production`) are used to:

  * Isolate secrets
  * Add manual approval for `Production`

## 🗂️ File Structure

```
.github/
└── workflows/
    └── deploy.yml
```

## 🛠️ Customization

* To extend or modify, adjust the `deploy.yml` file
* Add more jobs or environments as needed

## 📘 Documentation

* Detailed explanation: [info/github-actions-runner/README.md](../info/github-actions-runner/README.md)
