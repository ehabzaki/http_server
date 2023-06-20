variable "cluster_name" {
  description = "(Required) cluster name"
  type        = string
}

variable "env" {
  description = "(Required) environment to deploy in"
  type        = string
}

variable "eks_cluster_endpoint" {
  description = "(Required) environment to deploy in"
  type        = string
}
variable "eks_cluster_id" {
  description = "(Required) environment to deploy in"
  type        = string
}


variable "eks_cluster_certificate_authority_data" {
  description = "(Required) environment to deploy in"
  type        = string
}
variable "vpc_id" {
  description = "(Required) vpc id"
  type        = string
}
variable "lb_role" {
  description = "loadbalancer role"
  type        = string
}
