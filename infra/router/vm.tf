resource "libvirt_volume" "vyos_root" {
  name = "vyos-root.qcow2"
  size = 20 * 1024 * 1024 * 1024
}

resource "libvirt_domain" "vyos_server" {
  name   = "VyOS"
  memory = "8192"
  vcpu   = 4

  autostart = true
 
  boot_device {
    dev = [ "cdrom", "hd" ]
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
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
    bridge = var.external_bridge
    mac = var.external_mac
  }

  network_interface {
    bridge = var.internal_bridge
    mac = var.internal_mac
  }

  disk {
    file = format("%s%s", abspath(path.root), "/images/vyos.iso")
  }

  disk {
    volume_id = libvirt_volume.vyos_root.id
  }
}
