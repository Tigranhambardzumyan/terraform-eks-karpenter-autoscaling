
# Self-Hosted GitHub Actions Runner on AWS EC2

This guide explains how to set up and use a self-hosted GitHub Actions runner on an AWS EC2 instance to deploy Terraform infrastructure to different environments (`Development` and `Production`) using GitHub Environments.

---

## 🖼️ Architecture Overview

![Runner Diagram](github_actions_runner_diagram.png)

---

## 🧩 How It Works

1. **Push to GitHub Branch**
   - `development` → triggers deployment to AWS Dev
   - `master` → triggers deployment to AWS Prod (via `Production` GitHub Environment)

2. **GitHub Actions Workflow**
   - Executes `.github/workflows/deploy.yml`
   - Picks the corresponding GitHub Environment (`Development` or `Production`)

3. **Self-Hosted Runner (on EC2)**
   - Executes the job using Terraform CLI
   - Runs `terraform init`, `plan`, and `apply`
   - Uses GitHub Environment Secrets (e.g., AWS region, cluster name)

4. **Terraform**
   - Deploys infrastructure to corresponding AWS environment

---

## 🚀 Installation Steps

### 1. 🛠️ Create AWS EC2 Instance
- Use Amazon Linux 2 or Ubuntu
- Install Git, unzip, curl
- Recommended: `t3.medium` or higher

```bash
sudo yum update -y && sudo yum install -y git unzip curl
```

---

### 2. ⚙️ Register the Self-Hosted Runner

1. Go to your GitHub repo → **Settings → Actions → Runners**
2. Click **"New self-hosted runner"**
3. Choose OS (Linux) and architecture (x64)
4. Follow the provided instructions, e.g.:

```bash
curl -o actions-runner-linux-x64.tar.gz -L https://github.com/actions/runner/releases/download/v2.316.0/actions-runner-linux-x64-2.316.0.tar.gz
mkdir actions-runner && cd actions-runner
tar xzf ../actions-runner-linux-x64-2.316.0.tar.gz
./config.sh --url https://github.com/<your-username>/<your-repo> --token <generated-token>
./run.sh
```

---

### 3. 🏷️ Set Runner Labels

```bash
./config.sh --labels "self-hosted,terraform,aws"
```

---

### 4. 🔐 Set Up GitHub Environments

#### Development
- No review required
- Add secrets:
  - `TF_VARS_AWS_REGION`
  - `TF_VARS_CLUSTER_NAME`
  - `TF_VARS_PROJECT_TAG`

#### Production
- Require approval before deployment
- Add same secrets but with production values

---

## ✅ Verification

- Push to `development` branch → should auto-deploy to AWS Dev
- Push to `master` → triggers workflow but **requires manual approval** in the GitHub UI before deployment to Prod

---

## 📌 Notes

- The runner must stay online and connected to GitHub
- Use `screen` or `tmux` to run `./run.sh` in background, or set it up as a systemd service
