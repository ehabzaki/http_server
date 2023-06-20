
/* 
variable "default_tags" {
  description = "(Required) default tags"
  type        = map(any)
} */

variable "cluster_name" {
  description = "(Required) cluster name"
  type        = string
}

variable "env" {
  description = "(Required) environment to deploy in"
  type        = string
}

variable "cluster_version" {
  description = "(Required) eks version number"
  type        = string
}

variable "vpc_id" {
  description = "(Required) vpc id"
  type        = string
}

variable "private_subnets" {
  description = "(Required) private subnets of vpc"
  type        = list(any)
}


/* variable "cluster_endpoint_public_access_cidrs" {
  description = "(Required) cidr access to kubernetes api"
  type        = list(any)
} */

/* variable "coredns_version" {
  description = "(Required) eks addon coredns version"
  type        = string
}

variable "kube_proxy_version" {
  description = "(Required) eks addon kube-proxy version"
  type        = string
}

variable "vpc_cni_version" {
  description = "(Required) eks vpc-cni version"
  type        = string
} */

/* variable "managed_node_groups_cluster_version" {
  description = "EKS version. Defaults to `cluster_version`"
  type        = string
  default     = null
} */

variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 2
}

variable "capacity_type" {
  description = "(Optional) Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT"
  type        = string
  default     = "ON_DEMAND"
}

variable "nodes_instance_types" {
  description = "(Optional) security group to allow ssh access to worker node"
  type        = list(any)
  default     = ["t2.small","t3.small","t2.medium","t3.medium"]
}

variable "node_disk_size" {
  description = "(Optional) Disk size in GiB for worker nodes."
  type        = number
  default     = 20
}

/* variable "manage_aws_auth_configmap" {
  description = "Determines whether to manage the aws-auth configmap"
  type        = bool
  default     = false
} */

/* variable "aws_auth_roles" {
  description = "List of role maps to add to the aws-auth configmap"
  type        = list(any)
  default     = []
} */

/* variable "prefix_separator" {
  description = "For backwards compability"
  type        = string
  default     = "-"
} */

variable "cluster_security_group_description" {
  description = "For backwards compability"
  type        = string
  default     = "EKS cluster security group"
}

variable "cluster_security_group_name" {
  description = "For backwards compability"
  type        = string
  default     = null
}

variable "iam_role_name" {
  description = "For backwards compability"
  type        = string
  default     = null
}

/* variable "cluster_encryption_kms_key" {
  description = "For backwards compability"
  type        = string
  default     = null
} */




/* variable "create_atlantis_role" {
  description = "Determines whether to create atlantis role"
  type        = bool
  default     = true
} */