############################
# TERRAGRUNT CONFIGURATION #
############################

include "root" {
  path = find_in_parent_folders()
}

inputs = {   
  cilium_version = "1.17.0"
  cilium_cidr_list = "10.244.0.0/16"
  kube_api_host = "172.18.0.4"
  kube_api_port = "6443"
  operator_replicas = 1
  ipam_mode = "kubernetes"
}

terraform {
  source = "../../../modules//cilium"
}
