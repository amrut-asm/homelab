resource "libvirt_volume" "root_volume" {
  name   = "talos-worker-root${count.index+1}"
  source = "images/talos.qcow2"
  count = length(var.talos_worker_ip_list)
}

resource "libvirt_volume" "ceph_volume" {
  name   = "talos-worker-ceph${count.index+1}"
  size = 500 * 1024 * 1024 * 1024
  format = "raw"
  count = length(var.talos_worker_ip_list)
}

data "template_file" "user_data" {
  template = templatefile("${path.module}/config/cloud_init.cfg",
  {
    hostname = "compute-${count.index+1}"
  })
  count = length(var.talos_worker_ip_list)
}

data "template_file" "network_config" {
  template = templatefile("${path.module}/config/network_config.cfg",
  {
    address = element(var.talos_worker_ip_list, count.index),
    gateway = var.talos_gateway,
    nameserver = var.talos_nameserver
  })
  count = length(var.talos_worker_ip_list)
}

resource "libvirt_cloudinit_disk" "cloud-init" {
  name           = "cloud-init-talos-worker${count.index+1}.iso"
  user_data      = data.template_file.user_data[count.index].rendered
  network_config = data.template_file.network_config[count.index].rendered
  count = length(var.talos_worker_ip_list)
}

resource "libvirt_domain" "talos_server" {
  name   = "talos-worker${count.index+1}"
  memory = "32251"
  vcpu   = 16

  cloudinit = libvirt_cloudinit_disk.cloud-init[count.index].id

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
    bridge = "switch0"
    mac = element(var.talos_worker_mac_list, count.index)
  }

  disk {
    volume_id = libvirt_volume.root_volume[count.index].id
  }

  disk {
    volume_id = libvirt_volume.ceph_volume[count.index].id
  }

  count = length(var.talos_worker_ip_list)
}
