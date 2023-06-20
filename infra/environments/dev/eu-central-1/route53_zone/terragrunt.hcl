include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../modules//route53_zone"

}
inputs={  
  zone_name = "ehab.tech"
  }

