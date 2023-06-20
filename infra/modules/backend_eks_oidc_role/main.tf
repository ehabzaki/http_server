
  module "iam_iam-role-for-service-accounts-eks" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.20.0"
  role_name = "${var.role_name}"
  role_policy_arns = {
    policy = aws_iam_policy.eks_backend_access.id
  }
  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = ["${var.eks_namespace}:${var.eks_service_account}"]
    }
  }
}



resource "aws_iam_policy" "eks_backend_access" {
  name   =  "${var.role_name}-policy"
  path   = "/"
  policy = data.aws_iam_policy_document.eks_backend_access.json
}

data "aws_iam_policy_document" "eks_backend_access" {

  statement {
    actions = [
      "s3:*"
    ]
    resources = [
      "arn:aws:s3:::baqend-bucket/*",
    ]
  }
}