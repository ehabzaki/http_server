include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../modules//efs"
}

dependency "eks_cluster" {
  config_path = "..//eks_cluster"
}
dependency "vpc" {
  config_path = "..//vpc"
}

inputs = {
  cluster_name                     = dependency.eks_cluster.outputs.eks_cluster_name
  cluster_identity_oidc_issuer     = dependency.eks_cluster.outputs.eks_oidc_issuer
  cluster_identity_oidc_issuer_arn = dependency.eks_cluster.outputs.eks_oidc_arn
    eks_cluster_endpoint                = dependency.eks_cluster.outputs.eks_cluster_endpoint
  eks_cluster_certificate_authority_data = dependency.eks_cluster.outputs.eks_cluster_certificate_authority_data
  private_subnets_cidr_blocks = dependency.vpc.outputs.private_subnets_cidr_blocks
  azs =["eu-central-1a", "eu-central-1b"]
  private_subnets=dependency.vpc.outputs.private_subnets
  vpc_id = dependency.vpc.outputs.vpc_id
}