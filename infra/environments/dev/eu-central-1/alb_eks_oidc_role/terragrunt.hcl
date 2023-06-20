include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../modules//alb_eks_oidc_role"
}

dependency "eks-cluster" {
  config_path = "..//eks_cluster"
}

inputs = {
  oidc_provider_arn = dependency.eks-cluster.outputs.eks_oidc_arn
}