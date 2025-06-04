# Cluster Access Setup

This guide explains how to configure and access your Amazon EKS cluster securely.

## 1. Prerequisites

* AWS CLI configured with appropriate IAM permissions
* kubectl installed
* aws-iam-authenticator (optional, for certain EKS versions)

## 2. Update kubeconfig

Use the following command to generate or update your local kubeconfig file:

```bash
aws eks update-kubeconfig \
  --region $AWS_REGION \
  --name $CLUSTER_NAME
```

## 3. Verify Access

Run the following to confirm you can access the cluster:

```bash
kubectl get nodes
```

You should see a list of worker nodes (or none, if none are currently provisioned).

## 4. IAM Permissions for kubectl

Ensure your IAM identity is mapped correctly in the aws-auth config map to access the cluster:

```bash
kubectl edit configmap aws-auth -n kube-system
```

Add your IAM user or role under `mapUsers` or `mapRoles` as needed.

---

For more advanced access control, consider using `aws eks access-entry` and IAM identity mapping for fine-grained permissions.
