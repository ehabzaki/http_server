include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../modules//backend_eks_oidc_role"
}

dependency "eks-cluster" {
  config_path = "..//eks_cluster"
}

inputs = {
  role_name = "eks_backend_role"
  eks_service_account = "app"
  eks_namespace = "backend"
  oidc_provider_arn = dependency.eks-cluster.outputs.eks_oidc_arn
}