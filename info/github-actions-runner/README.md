# GitHub Actions Runner Setup

This directory documents the setup and usage of **GitHub self-hosted runners** for running Terraform workflows securely and efficiently.

## 🖥️ Runner Configuration

The repository uses a **self-hosted runner** registered with the `labels: [self-hosted, terraform]` tag. This runner must:

* Be an EC2 instance (Amazon Linux 2 or Ubuntu recommended)
* Have Terraform pre-installed (version managed via `TERRAFORM_VERSION` GitHub variable)
* Have AWS CLI and `kubectl` installed
* Be registered with your repository under GitHub Actions -> Settings -> Runners

See [self-hosted-runner.md](self-hosted-runner.md) for step-by-step instructions and architecture diagrams.

## 🔐 Security

* Use **environment secrets** and **GitHub environment protection rules** for Production.
* Never hardcode AWS credentials or sensitive information.

## 🧩 Diagram

Refer to the diagrams:

![Terraform CI/CD Workflow](info/github-actions-runner/github_actions_diagram.png)


## 💡 Notes

* The runner should have a persistent EBS volume or be backed up if ephemeral
* Tags should be applied for cost tracking and auditing

---

This runner powers the automation in `.github/workflows/deploy.yml` for deploying EKS clusters with Karpenter.
