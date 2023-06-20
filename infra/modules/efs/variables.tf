variable "enabled" {
  type    = bool
  default = true
}


variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "cluster_identity_oidc_issuer" {
  type        = string
  description = "The OIDC Identity issuer for the cluster."
}

variable "cluster_identity_oidc_issuer_arn" {
  type        = string
  description = "The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account."
}
variable "eks_cluster_certificate_authority_data" {
  type        = string
  description = "eks cluster certificate authority data"
}
variable "eks_cluster_endpoint" {
  type        = string
  description = "eks cluster certificate authority data"
}


variable "helm_chart_name" {
  type        = string
  default     = "aws-efs-csi-driver"
  description = "Amazon EFS CSI Driver chart name."
}

variable "helm_chart_release_name" {
  type        = string
  default     = "aws-efs-csi-driver"
  description = "Amazon EFS CSI Driver release name."
}

variable "helm_chart_repo" {
  type        = string
  default     = "https://kubernetes-sigs.github.io/aws-efs-csi-driver/"
  description = "Amazon EFS CSI Driver repository name."
}

variable "helm_chart_version" {
  type        = string
  default     = "2.2.0"
  description = "Amazon EFS CSI Driver chart version."
}

variable "create_namespace" {
  type        = bool
  default     = true
  description = "Whether to create k8s namespace with name defined by `namespace`."
}

variable "namespace" {
  type        = string
  default     = "kube-system"
  description = "Kubernetes namespace to deploy EFS CSI Driver Helm chart."
}

variable "service_account_name" {
  type        = string
  default     = "aws-efs-csi-driver"
  description = "Amazon EFS CSI Driver service account name."
}

variable "mod_dependency" {
  default     = null
  description = "Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable."
}

variable "settings" {
  default     = {}
  description = "Additional settings which will be passed to the Helm chart values, see https://github.com/kubernetes-sigs/aws-efs-csi-driver."
}

variable "private_subnets_cidr_blocks" {
 type        = list(string)
}

variable "azs" {
 type        = list(string)
}
variable "private_subnets" {
 type        = list(string)
}
variable "vpc_id" {
 type        = string
}

