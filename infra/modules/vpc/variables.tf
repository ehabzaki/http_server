# AWS
variable "cluster_name" {
  description = "AWS Region deploying to"
}

variable "env" {
  description = "Env deploying in"
}

variable "aws_region" {
  description = "AWS Region deploying to"
}

variable "cidr" {
  description = "CIDR network for VPC"
}


variable "azs" {
  description = "List of availability zones"
  type        = list
}

variable "name" {
  description = "VPC name"
}
