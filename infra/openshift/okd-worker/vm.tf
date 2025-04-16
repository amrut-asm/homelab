resource "libvirt_volume" "root" {
  name   = "root-okd-worker${count.index+1}"
  source = "images/coreos.qcow2"
  format = "qcow2"
  count = var.vm_count
}

resource "libvirt_volume" "ceph-disk" {
  name   = "ceph-volume-okd-worker${count.index+1}"
  size = 200 * 1024 * 1024 * 1024
  format = "raw"
  count = var.vm_count
}

resource "libvirt_ignition" "ignition" {
  name    = "ignition-okd-worker${count.index+1}"
  content = file("openshift-generated/worker.ign")
  count = var.vm_count
}

resource "libvirt_domain" "node" {
  name   = "okd-worker${count.index+1}"
  memory = "32251"
  vcpu   = 16

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

  disk {
    volume_id = libvirt_volume.ceph-disk[count.index].id
  }
  
  count = var.vm_count
}
