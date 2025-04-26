module "router" {
  source = "./infra/router"
  internal_mac = var.router_internal_mac
  external_mac = var.router_external_mac
  internal_bridge = var.internal_bridge
  external_bridge = var.external_bridge
}

module "containers" {
  source   = "./infra/containers"
  internal_mac = var.containers_internal_mac
  external_mac = var.containers_external_mac
  internal_bridge = var.internal_bridge
  external_bridge = var.external_bridge
  internal_ip = var.containers_internal_ip
  external_ip = var.containers_external_ip
  internal_gateway = var.containers_internal_gateway
  external_gateway = var.containers_external_gateway
  internal_subnet = var.containers_internal_subnet
  external_subnet = var.containers_external_subnet
  dns_server = var.containers_dns_server
  user_name = var.containers_user_name
  domain_name = var.containers_domain_name
  ssh_key = var.containers_ssh_key
  hostname = var.containers_hostname
  private_key_path = var.containers_private_key_path
  internal_quay_registry_address = var.containers_internal_quay_registry_address
  internal_docker_registry_address = var.containers_internal_docker_registry_address
  internal_k8s_registry_address = var.containers_internal_k8s_registry_address
  internal_gcr_registry_address = var.containers_internal_gcr_registry_address
  internal_ghcr_registry_address = var.containers_internal_ghcr_registry_address
  internal_openshift_ci_registry_address = var.containers_internal_openshift_ci_registry_address
  internal_registry_address = var.containers_internal_registry_address
}

module "openshift-config-generator" {
  source = "./infra/openshift/openshift-config-generator"
}

module "openshift-dns-validator" {
  source = "./infra/openshift/openshift-dns-validator"
  domain = var.openshift_domain
}

module "openshift-bootstrap" {
  source = "./infra/openshift/okd-bootstrap"
  internal_mac = var.os_bootstrap_internal_mac
  internal_bridge = var.internal_bridge
}

module "openshift-master" {
  source = "./infra/openshift/okd-master"
  vm_count = var.os_master_vm_count
  mac_list = var.os_master_mac_list
  internal_bridge = var.internal_bridge
}

module "openshift-worker" {
  source = "./infra/openshift/okd-worker"
  vm_count = var.os_worker_vm_count
  mac_list = var.os_worker_mac_list
  internal_bridge = var.internal_bridge
}
