include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../modules//eks_cluster"
}

dependency "vpc" {
  config_path = "..//vpc"
}


inputs ={
  cluster_version                       = "1.27" 
  vpc_id                               = dependency.vpc.outputs.vpc_id
   private_subnets                 = dependency.vpc.outputs.private_subnets
}
