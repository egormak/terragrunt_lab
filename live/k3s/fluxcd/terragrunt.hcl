############################
# TERRAGRUNT CONFIGURATION #
############################

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  github_org = "egormak"   
  github_repository = "fluxcd_begin"
  github_token = "TOKEN"
  flux_cluster_path = "clusters/k3s"
}

terraform {
  source = "../../../modules//flux"
}

dependencies {
  paths = ["../cilium"]
}
