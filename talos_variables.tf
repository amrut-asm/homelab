# Variables for Master Talos VMs

variable "talos_master_mac_list" {
  type = list
}

variable "talos_master_ip_list" {
    type = list
}

# Variables for Worker Talos VMs

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

variable "talos_cluster_name" {
  description = "A name to provide for the Talos cluster"
  type        = string
}

variable "talos_cluster_endpoint" {
  description = "The endpoint for the Talos cluster"
  type        = string
}

variable talos_extra_ca_certificate_path {
  description = "Path to the extra CA certificate"
  type        = string
}

variable "talos_controlplane_nodes" {
  description = "A list of control plane node IPs"
  type        = list(string)
}

variable "talos_worker_nodes" {
  description = "A list of worker node IPs"
  type        = list(string)
}