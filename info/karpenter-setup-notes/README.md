# Karpenter Setup Notes

These notes cover the setup and configuration of Karpenter as part of an EKS cluster using Terraform and Helm.

## 1. Karpenter Requirements

* Kubernetes version >= 1.21
* OIDC provider enabled on the EKS cluster
* Proper IAM roles and instance profiles created

## 2. Terraform-Based Installation

Karpenter is provisioned using a Terraform module under `terraform/modules/karpenter`.

Make sure the following values are passed to the module via GitHub secrets or environment variables:

* `cluster_name`
* `cluster_endpoint`
* `cluster_ca`
* `karpenter_role_arn`
* `instance_profile_name`
* `interruption_queue_name`

## 3. Helm Release Configuration

Karpenter is deployed via Helm using the `helm_release` resource. Key values include:

* Cluster endpoint, CA, and name
* IAM Role annotations for IRSA
* Instance profile for EC2 provisioning
* Interruption queue name for lifecycle management

## 4. Namespace

Karpenter is deployed into a dedicated namespace (`karpenter`). Terraform creates this namespace.

## 5. Post-Deployment

Once deployed, you can define Karpenter `Provisioner` and `NodePool` CRDs to begin managing node lifecycle.
