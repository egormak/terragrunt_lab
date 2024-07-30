variable "vms" {
  type = map(object({
    memory = string
    vcpu   = number
    disk_size = number
    ip_address = string
  }))

  default = {}
  
}