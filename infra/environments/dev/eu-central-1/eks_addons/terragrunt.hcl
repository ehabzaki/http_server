include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../modules//eks_addons"
}
dependency "vpc" {
  config_path = "..//vpc"
}


dependency "eks_cluster" {
  config_path = "..//eks_cluster"
}

dependency "alb_eks_oidc_role" {
  config_path = "..//alb_eks_oidc_role"
}

inputs ={

  vpc_id                               = dependency.vpc.outputs.vpc_id
  eks_cluster_endpoint                = dependency.eks_cluster.outputs.eks_cluster_endpoint
  eks_cluster_certificate_authority_data = dependency.eks_cluster.outputs.eks_cluster_certificate_authority_data
  eks_cluster_id                      = dependency.eks_cluster.outputs.eks_cluster_name
  lb_role  =   dependency.alb_eks_oidc_role.outputs.loadbalancer_role
  cluster_name = dependency.eks_cluster.outputs.eks_cluster_name

}
