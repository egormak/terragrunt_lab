############################
# TERRAGRUNT CONFIGURATION #
############################

include "root" {
  path = find_in_parent_folders()
}

inputs = {   
  // cilium_version = "1.15.6"
  fluxcd_version = "2.3.0"
  github_repository = "egorka"
}

terraform {
  source = "../../../modules//fluxcd"
}
