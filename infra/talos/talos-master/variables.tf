# Variables for Master Talos VMs

variable "talos_master_mac_list" {
  type = list
}

variable "talos_master_ip_list" {
    type = list
}

variable talos_gateway {
  type = string
}

variable talos_nameserver {
  type = string
}