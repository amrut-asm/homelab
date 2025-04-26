###################################################
#               GENERIC                           #
###################################################
internal_bridge = "switch0"
external_bridge = "bridge0"

###################################################
#               ROUTER                            #  
###################################################
router_internal_mac = "c0:ff:ee:00:00:01"
router_external_mac = "fe:d4:a4:64:14:a8"

openshift_domain = "internal.nanibot.net"

###################################################
#               Containers                        #  
###################################################
containers_internal_mac = "c0:ff:ee:00:02:50"
containers_external_mac = "96:c2:0e:36:09:75"

containers_internal_ip = "192.168.16.2"
containers_external_ip = "192.168.1.250"
containers_internal_subnet = "192.168.16.0/24"
containers_external_subnet = "192.168.1.0/24"
containers_internal_gateway = "192.168.16.1"
containers_external_gateway = "192.168.1.1"
containers_dns_server = "192.168.16.1"

containers_user_name = "nanibot"
containers_domain_name = "internal.nanibot.net"
containers_hostname = "containers"
containers_private_key_path = "/home/nanibot/.ssh/id_rsa"
containers_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTii6pRrQo87g08pCMfyVmvL7u8c3Byxb/LFPDBMbwGgV1LgSJCY8VD7zoHX85xN7odpWPyhJOtSEhTTGsjTbxroTFwJUQ6f9f6XhgiitShOOtaMwnhWxg9XH2wBhOFTfrB2FC+zAr9iR89kHQdfxoVPVhfg34Kg8085l16Vophst/fDnE5TxmZi4jMdkSQndOcnL2jcmf/Gvz/LGNxzpXzQ85D9xs9HufeXV6SU/Haeg3O8eDev4dFJ+WB4oE/Ht43xiiCrqbrllDo13tQ1PohZnHJDlLgFpk4AqAmCMPRYpk9QPjCnzTVU8XEh4CxQ3n736biV8R3KRmz6azJoQFCvHTm0N1+4SteKtoFB8PW7PA4RvhNvf8vIxvcDGdK/82riNaxbNjnIHK0bzWWAySvSf57yVGow9X/ymyK4/kAWD4n0EVEtKPdKh7DO455d3BRJUXtPKpPGVnLr2Awnc4nsWOrHb4J8Hu2iI7sAQeoxon2e4WDKSYRENq8FAtseU= nanibot@diablo.internal.nanibot.net"

containers_internal_registry_address = "192.168.16.3"
containers_internal_quay_registry_address = "192.168.16.4"
containers_internal_docker_registry_address = "192.168.16.5"
containers_internal_k8s_registry_address = "192.168.16.6"
containers_internal_gcr_registry_address = "192.168.16.7"
containers_internal_ghcr_registry_address = "192.168.16.8"
containers_internal_openshift_ci_registry_address = "192.168.16.9"

###################################################
#               OpenShift                         #  
###################################################

os_bootstrap_internal_mac = "c0:ff:ee:00:00:11"

os_master_vm_count = 3
os_master_mac_list = [ "c0:ff:ee:00:00:12", "c0:ff:ee:00:00:13", "c0:ff:ee:00:00:14" ]

os_worker_vm_count = 5
os_worker_mac_list = [ "c0:ff:ee:00:00:15", "c0:ff:ee:00:00:16", "c0:ff:ee:00:00:17", "c0:ff:ee:00:00:18", "c0:ff:ee:00:00:19" ]
