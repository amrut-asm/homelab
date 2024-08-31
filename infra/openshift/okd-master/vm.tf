resource "libvirt_volume" "root" {
  name   = "root-okd-master${count.index+1}"
  source = "images/coreos.qcow2"
  format = "qcow2"
  count = var.vm_count
}

resource "libvirt_ignition" "ignition" {
  name    = "ignition-okd-master${count.index+1}"
  content = file("openshift-generated/master.ign")
  count = var.vm_count
}

resource "libvirt_domain" "node" {
  name   = "okd-master${count.index+1}"
  memory = "16384"
  vcpu   = 8

  autostart = false

  coreos_ignition = libvirt_ignition.ignition[count.index].id

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type = "vnc"
    listen_type = "address"
  }

  cpu {
    mode = "host-passthrough"
  }

  network_interface {
    bridge = var.internal_bridge
    mac = element(var.mac_list, count.index)
  }

  disk {
    volume_id = libvirt_volume.root[count.index].id
  }
  
  count = var.vm_count
}
