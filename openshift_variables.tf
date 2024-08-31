variable "openshift_domain" {
  type = string
}

# Variables for bootstrap OpenShift VM

variable "os_bootstrap_internal_mac" {
    type = string
}

# Variables for Master OpenShift VMs

variable "os_master_vm_count" {
  type = number
}

variable "os_master_mac_list" {
  type = list
}

# Variables for Worker OpenShift VMs

variable "os_worker_vm_count" {
  type = number
}

variable "os_worker_mac_list" {
  type = list
}