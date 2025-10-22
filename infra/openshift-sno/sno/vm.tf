resource "libvirt_volume" "root" {
  name   = "root-okd-sno"
  size 	 = 200 * 1024 * 1024 * 1024
  format = "qcow2"
}

resource "libvirt_domain" "node" {
  name   = "okd-sno"
  memory = "16384"
  vcpu   = 8

  autostart = true

  boot_device {
    dev = [ "hd", "cdrom" ]
  }

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
    file = format("%s%s", abspath(path.root), "/images/fcos-live.iso")
  }

  disk {
    volume_id = libvirt_volume.root.id
  }
}
