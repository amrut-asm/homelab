resource "libvirt_volume" "services_volume" {
  name   = "services-root"
  source = "images/image.qcow2"
  format = "qcow2"
}

data "template_file" "user_data" {
  template = templatefile("${path.module}/config/cloud_init.cfg",
  {
    hostname = var.hostname,
    domain_name = var.domain_name,
    user_name = var.user_name,
    ssh_key = var.ssh_key
  })
}

data "template_file" "network_config" {
  template = templatefile("${path.module}/config/network_config.cfg",
  {
    external_ip = var.external_ip,
    internal_ip = var.internal_ip,
    internal_gateway = var.internal_gateway,
    external_gateway = var.external_gateway,
    dns_server = var.dns_server
  })
}

resource "libvirt_cloudinit_disk" "cloud-init" {
  name           = "cloud-init-services-server.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
}

resource "libvirt_domain" "services_server" {
  name   = "Services"
  memory = "8192"
  vcpu   = 4

  cloudinit = libvirt_cloudinit_disk.cloud-init.id

  autostart = true

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
    volume_id = libvirt_volume.services_volume.id
  }
}
