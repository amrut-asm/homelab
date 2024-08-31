# Variable definitions for docker_host VM

variable "containers_internal_mac" {
  type = string
}

variable "containers_external_mac" {
  type = string
}

variable "containers_internal_ip" {
  type = string
}

variable "containers_external_ip" {
  type = string
}

variable "containers_internal_gateway" {
  type = string
}

variable containers_external_gateway {
  type = string
}

variable containers_internal_subnet {
  type = string
}

variable containers_external_subnet {
  type = string
}

variable "containers_dns_server" {
  type = string
}

variable "containers_user_name" {
  type = string
}

variable "containers_hostname" {
  type = string
}

variable "containers_domain_name" {
  type = string
}

variable "containers_private_key_path" {
  type = string
}

variable "containers_ssh_key" {
  type = string
}

variable "containers_do_token" {
  type = string
}

variable containers_internal_openshift_lb_address {
  type = string
}

variable containers_external_openshift_lb_address {
  type = string
}

variable containers_internal_quay_registry_address {
  type = string
}

variable containers_internal_docker_registry_address {
  type = string
}

variable containers_internal_k8s_registry_address {
  type = string
}

variable containers_internal_gcr_registry_address {
  type = string
}

variable containers_internal_ghcr_registry_address {
  type = string
}

variable containers_internal_openshift_ci_registry_address {
  type = string
}