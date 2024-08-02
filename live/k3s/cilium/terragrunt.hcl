############################
# TERRAGRUNT CONFIGURATION #
############################

include "root" {
  path = find_in_parent_folders()
}

inputs = {   
  cilium_version = "1.15.6"
  cilium_cidr_list = "10.42.0.0/16"
  kube_api_port = "6443"

}

terraform {
  source = "../../../modules//cilium"
}
