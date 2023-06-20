module "efs" {
  source  = "terraform-aws-modules/efs/aws"
  version = "1.1.1"
  name           = var.cluster_name
  creation_token = var.cluster_name
  encrypted      = true

  performance_mode = "generalPurpose"
  throughput_mode                 = "provisioned"
  provisioned_throughput_in_mibps = 256

  lifecycle_policy = {
    transition_to_ia                    = "AFTER_30_DAYS"
    transition_to_primary_storage_class = "AFTER_1_ACCESS"
  }
  attach_policy                      = false
  bypass_policy_lockout_safety_check = false

  mount_targets              = { for k, v in zipmap(var.azs, var.private_subnets) : k => { subnet_id = v } }
  security_group_description = "EFS security group"
  security_group_vpc_id      = var.vpc_id
  security_group_rules = {
    vpc = {
      description = "NFS ingress from VPC private subnets"
      cidr_blocks = var.private_subnets_cidr_blocks
    }
  }
  enable_backup_policy = true
}