include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../modules//vpc"
}

inputs = {
  name                            = "dev"
  cidr                             = "10.0.0.0/16"
  azs                             = ["eu-central-1a", "eu-central-1b"]
}