############################
# TERRAGRUNT CONFIGURATION #
############################

include "root" {
  path = find_in_parent_folders()
}

inputs = {   
  vms = {
    "controlplane01"  = { memory = "4096", vcpu = 4, disk_size = 32212254720, ip_address = "192.168.29.10" },
    "worker01"        = { memory = "4096", vcpu = 4, disk_size = 32212254720, ip_address = "192.168.29.11" },
    "worker02"        = { memory = "4096", vcpu = 4, disk_size = 32212254720, ip_address = "192.168.29.12" },
    "k3s01"           = { memory = "4096", vcpu = 4, disk_size = 32212254720, ip_address = "192.168.29.13" },
  }

}

terraform {
  source = "../../../modules//libvirt"
}
