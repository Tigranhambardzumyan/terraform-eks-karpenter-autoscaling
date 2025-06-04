# Testing Strategy for EKS with Karpenter

This document outlines the testing approach for validating infrastructure deployed with Terraform and workloads managed by Karpenter.

## 1. Infrastructure Testing

### a. Terraform Validation

* Use `terraform validate` to check syntax
* Use `terraform plan` to preview changes

### b. CI/CD Pipeline

* GitHub Actions with environment-specific validation
* Manual approval required for Production deployments

### c. Output Verification

* Capture `terraform output` and compare expected outputs

## 2. Karpenter Functionality Testing

### a. Provisioning Tests

* Deploy test workloads with specific `nodeSelector`:

  * `kubernetes.io/arch: arm64`
  * `kubernetes.io/arch: amd64`
* Verify corresponding instance types are provisioned

### b. Scale Tests

* Deploy pods with high replica counts to test Karpenter autoscaling
* Observe lifecycle events and interruptions

## 3. Monitoring and Logging

* Use `kubectl get nodes -o wide` to observe node types
* Ensure logs are collected from Karpenter controller
* Monitor SQS interruption queue activity

## 4. Cleanup

* Run `scripts/cleanup.sh` to tear down test resources
* Verify resource deletion in AWS Console
