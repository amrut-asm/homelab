# Variables for worker Talos VMs

variable "talos_worker_mac_list" {
  type = list
}

variable "talos_worker_ip_list" {
    type = list
}

variable talos_gateway {
  type = string
}

variable talos_nameserver {
  type = string
}
