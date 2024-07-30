provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_cloudinit_disk" "commoninit" {
  for_each        = var.vms
  name            = "commoninit-${each.key}.iso"
  pool            = "default"
  user_data       = file("user-data.yaml")
  network_config  = templatefile("network-config.yaml", {
    ip_address = each.value.ip_address
  })
}

resource "libvirt_volume" "ubuntu_qcow2" {
  name   = "ubuntu_qcow2"
  pool   = "default"
  source = "https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.img"
  format = "qcow2"
}

resource "libvirt_volume" "ubuntu_img" {
  for_each = var.vms
  name   = "ubuntu-${each.key}.qcow2"
  base_volume_id  = libvirt_volume.ubuntu_qcow2.id
  pool   = "default"
  size   = each.value.disk_size
}

resource "libvirt_domain" "ubuntu_vm" {
  for_each = var.vms
  name   = "ubuntu-${each.key}"
  memory   = each.value.memory
  vcpu     = each.value.vcpu

  cloudinit = libvirt_cloudinit_disk.commoninit[each.key].id

  disk {
    volume_id = libvirt_volume.ubuntu_img[each.key].id
  }

  network_interface {
    network_name = "default"
    addresses  = [each.value.ip_address]
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
  
  graphics {
    type = "spice"
    listen_type = "address"
    autoport = "true"
  }

}