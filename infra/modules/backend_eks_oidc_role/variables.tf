variable "oidc_provider_arn" {
  type        = string
}
variable "role_name" {
  type        = string
}

variable "eks_namespace" {
  description = "The Kubernetes namespace"
  type        = string
}

variable "eks_service_account" {
  description = "The kubernetes service account"
  type        = string
}

