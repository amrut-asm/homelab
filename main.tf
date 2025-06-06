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

module "talos-master" {
  source = "./infra/talos/talos-master"
  talos_master_mac_list = var.talos_master_mac_list
  talos_master_ip_list = var.talos_master_ip_list
  talos_gateway = var.talos_gateway
  talos_nameserver = var.talos_nameserver
}

module "talos-worker" {
  source = "./infra/talos/talos-worker"
  talos_worker_mac_list = var.talos_worker_mac_list
  talos_worker_ip_list = var.talos_worker_ip_list
  talos_gateway = var.talos_gateway
  talos_nameserver = var.talos_nameserver
}

module talos-init {
  source = "./infra/talos/talos-init"
  cluster_endpoint = var.talos_cluster_endpoint
  cluster_name = var.talos_cluster_name
  talos_controlplane_nodes = var.talos_controlplane_nodes
  talos_worker_nodes = var.talos_worker_nodes
}

module talos-helm {
  source = "./infra/talos/talos-helm"
}

module "gns3" {
  source = "./infra/gns3"
  internal_mac = var.gns3_internal_mac
  external_mac = var.gns3_external_mac
  internal_bridge = var.internal_bridge
  external_bridge = var.external_bridge
  internal_ip = var.gns3_internal_ip
  external_ip = var.gns3_external_ip
  internal_gateway = var.gns3_internal_gateway
  external_gateway = var.gns3_external_gateway
  internal_subnet = var.gns3_internal_subnet
  external_subnet = var.gns3_external_subnet
  dns_server = var.gns3_dns_server
  user_name = var.gns3_user_name
  domain_name = var.gns3_domain_name
  ssh_key = var.gns3_ssh_key
  hostname = var.gns3_hostname
  private_key_path = var.gns3_private_key_path
}