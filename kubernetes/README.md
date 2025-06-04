# Kubernetes Deployments for Testing Karpenter

This directory contains Kubernetes manifests for testing the functionality of Karpenter on both x86 and ARM64 (Graviton) instance types.

---

## 🚀 Files Included

| File                    | Description |
|-------------------------|-------------|
| `namespace.yaml`        | Creates a `karpenter-demo` namespace for isolating test workloads. |
| `x86-deployment.yaml`   | Sample deployment with node selectors to schedule on x86 architecture nodes. |
| `graviton-deployment.yaml` | Sample deployment with node selectors to schedule on ARM64 (Graviton) nodes. |

---

## 🧪 How to Use

Ensure your EKS cluster is deployed and Karpenter is configured with instance types that support both x86 and ARM64.

### Apply namespace
```bash
kubectl apply -f namespace.yaml
