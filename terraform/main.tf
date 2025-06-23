

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = var.vpc_name
  cidr   = var.vpc_cidr

  azs             = var.availability_zones
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true
  tags = {
    Project = var.project_tag
  }
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = var.private_subnets
  vpc_id          = module.vpc.vpc_id

  enable_irsa = true
  manage_aws_auth = true

  eks_managed_node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
    }
  }

  tags = {
    Project = var.project_tag
  }
}

module "karpenter" {
  source              = "./modules/karpenter"
  cluster_name        = var.cluster_name
  cluster_endpoint    = var.cluster_endpoint
  oidc_provider_arn   = var.oidc_provider_arn
  subnet_ids          = var.private_subnets
  security_group_ids  = var.security_group_ids
  tags = {
    Project = var.project_tag
  }
}

output "cluster_name" {
  value = var.cluster_name
}

output "karpenter_irsa_arn" {
  value = module.karpenter.irsa_arn
}

