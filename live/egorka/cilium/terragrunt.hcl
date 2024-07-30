############################
# TERRAGRUNT CONFIGURATION #
############################

include "root" {
  path = find_in_parent_folders()
}

inputs = {   
  cilium_version = "1.15.6"
}

terraform {
  source = "../../../modules//cilium"
}
