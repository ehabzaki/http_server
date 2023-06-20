

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name                = var.name
  cidr                = var.cidr
  azs                 = var.azs
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
    "karpenter.sh/discovery" = "${var.cluster_name}-${var.env}"

  }
  public_subnets      = [for k, v in var.azs : cidrsubnet(var.cidr, 8, k + 4)]
  private_subnets     = [for k, v in var.azs : cidrsubnet(var.cidr, 8, k)]
  create_database_subnet_group  = true
  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
    "karpenter.sh/discovery" = "${var.cluster_name}-${var.env}"
  }
  enable_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}-${var.env}" = " owned"
    "karpenter.sh/discovery" = "${var.cluster_name}-${var.env}"

  }
}