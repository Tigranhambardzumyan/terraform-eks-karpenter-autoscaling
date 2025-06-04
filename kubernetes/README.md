# Kubernetes Demo Workloads

This directory includes sample Kubernetes manifests for demonstrating how Karpenter can provision ARM64 (Graviton) and AMD64 (x86) nodes.

## Files

- `namespace.yaml`: Creates a dedicated namespace `karpenter-demo`.
- `graviton-deployment.yaml`: Deploys a pod to ARM64 (Graviton) nodes using a `nodeSelector`.
- `x86-deployment.yaml`: Deploys a pod to AMD64 (x86) nodes using a `nodeSelector`.

## Usage

Apply the resources:

```bash
kubectl apply -f namespace.yaml
kubectl apply -f graviton-deployment.yaml
kubectl apply -f x86-deployment.yaml
```

## Verify

Check that pods are scheduled to correct node types:

```bash
kubectl get pods -n karpenter-demo -o wide
```

## Cleanup

```bash
kubectl delete -f graviton-deployment.yaml
kubectl delete -f x86-deployment.yaml
kubectl delete -f namespace.yaml
```
