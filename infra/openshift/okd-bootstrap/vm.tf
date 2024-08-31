resource "libvirt_volume" "root" {
  name   = "root-okd-bootstrap"
  source = "images/coreos.qcow2"
  format = "qcow2"
}

resource "libvirt_ignition" "ignition" {
  name    = "ignition-okd-bootstrap"
  content = file("openshift-generated/bootstrap.ign")
}

resource "libvirt_domain" "node" {
  name   = "okd-bootstrap"
  memory = "16384"
  vcpu   = 4

  coreos_ignition = libvirt_ignition.ignition.id

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
    mac = var.internal_mac
  }

  disk {
    volume_id = libvirt_volume.root.id
  }
}
