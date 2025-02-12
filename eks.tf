module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "tetris-cluster"
  cluster_version = "1.31"

  # Optional
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = ["0.0.0.0"]
  cluster_endpoint_private_access      = true

  # cluster addons
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
  }

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true
  enable_irsa                              = true

  # kms_key_options
  enable_kms_key_rotation         = true
  kms_key_deletion_window_in_days = 7

  kms_key_administrators = [
    "arn:aws:iam::901978288702:user/MacBookPro", "arn:aws:iam::901978288702:user/nextera-solutions-site"
  ]

  # custome security group for nodes
  node_security_group_id   = aws_security_group.eks-workers-sg.id
  node_security_group_name = aws_security_group.eks-workers-sg.name

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  tags = {
    Terraform   = "true"
    Environment = "sandbox"
    Version     = "0.1.0"
  }
}
