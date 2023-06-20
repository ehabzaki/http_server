
 output "eks_oidc_arn" {
  value = module.eks.oidc_provider_arn
} 

output "eks_oidc_issuer" {
  value = module.eks.cluster_oidc_issuer_url
}

output "eks_cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "eks_cluster_version" {
  value = module.eks.cluster_version
}

output "eks_cluster_primary_security_group_id" {
  value = module.eks.cluster_primary_security_group_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  value = module.eks.cluster_arn
} 
  
/* output "worker_security_group" {
  value = aws_security_group.worker.id
} */
/* output "loadbalancer_role" {
  value = module.lb_role.iam_role_arn 
} */

output "cluster_client_key" {
  value = module.eks.cluster_id
}