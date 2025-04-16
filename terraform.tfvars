###################################################
#               GENERIC                           #
###################################################
internal_bridge = ""
external_bridge = ""

###################################################
#               ROUTER                            #  
###################################################
router_internal_mac = ""
router_external_mac = ""

openshift_domain = ""

###################################################
#               Containers                        #  
###################################################
containers_internal_mac = ""
containers_external_mac = ""

containers_internal_ip = ""
containers_external_ip = ""
containers_internal_subnet = ""
containers_external_subnet = ""
containers_internal_gateway = ""
containers_external_gateway = ""
containers_dns_server = ""

containers_user_name = ""
containers_domain_name = ""
containers_hostname = ""
containers_do_token = ""
containers_private_key_path = ""
containers_ssh_key = ""

containers_internal_openshift_lb_address = ""
containers_external_openshift_lb_address = ""
containers_internal_quay_registry_address = ""
containers_internal_docker_registry_address = ""
containers_internal_k8s_registry_address = ""
containers_internal_gcr_registry_address = ""
containers_internal_ghcr_registry_address = ""
containers_internal_openshift_ci_registry_address = ""
containers_internal_registry_address = ""

###################################################
#               OpenShift                         #  
###################################################

os_bootstrap_internal_mac = ""

os_master_vm_count =
os_master_mac_list = [ "" ]

os_worker_vm_count =
os_worker_mac_list = [ "" ]
