############################
# TERRAGRUNT CONFIGURATION #
############################

include "root" {
  path = find_in_parent_folders()
}

inputs = {   
  age_key = "TOKEN"
}

terraform {
  source = "../../../modules//flux-postinstall"
}

dependencies {
  paths = ["../cilium","../flux"]
}

// # Include the envcommon configuration for the component. The envcommon configuration contains settings that are common
// # for the component across all environments.
// include "envcommon" {
//   path = "${dirname(find_in_parent_folders())}/_envcommon/webserver-cluster.hcl"
// }


// # ---------------------------------------------------------------------------------------------------------------------
// # Override parameters for this environment
// # ---------------------------------------------------------------------------------------------------------------------

// # For production, we want to specify bigger instance classes and cluster, so we specify override parameters here. These
// # inputs get merged with the common inputs from the root and the envcommon terragrunt.hcl
