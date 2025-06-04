# 🛠️ Utility Scripts

This directory contains helper scripts to manage and validate the infrastructure and Kubernetes workloads provisioned by this repository.

---

## 📄 Contents

| Script        | Description |
|---------------|-------------|
| `cleanup.sh`  | Deletes the Kubernetes resources (deployments and namespaces) used for testing Karpenter with x86 and Graviton nodes. |
| `verify.sh`   | Verifies that Karpenter successfully scheduled pods on both x86 and arm64 nodes. Useful for post-deployment validation. |

---

## 🔧 Usage

### Prerequisites

Ensure you are authenticated to the correct Kubernetes cluster before running these scripts:

```bash
aws eks update-kubeconfig --name <your-cluster-name> --region <region>
