module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"
  cluster_name                    = "${var.cluster_name}-${var.env}"
  cluster_version                 = var.cluster_version
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  create_cni_ipv6_iam_policy = true
  cluster_addons = {
    
    coredns = {
      preserve    = true
      most_recent = true

      timeouts = {
        create = "25m"
        delete = "10m"
      }
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  eks_managed_node_groups = {

    worker_spot = {
    min_size        = var.min_size
    max_size        = var.max_size
    desired_size    = var.desired_size
    instance_types  = var.nodes_instance_types
    capacity_type   = var.capacity_type
    update_config = {
        max_unavailable_percentage = 33
    }
          ebs = {
            volume_size           = 5
            volume_type           = "gp2"
            iops                  = 3000
            throughput            = 150
            encrypted             = true
            delete_on_termination = true
          }

    }
  }
  manage_aws_auth_configmap = true
}

