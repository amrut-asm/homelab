#!/bin/vbash
source /opt/vyatta/etc/functions/script-template
configure
# Interfaces Configuration
set interfaces ethernet eth1 address 192.168.16.1/24
set interfaces ethernet eth1 description LAN

set interfaces ethernet eth0 address 192.168.1.101/24
set interfaces ethernet eth0 description WAN

# SSH Configuration
set service ssh port 22

# NAT
set nat source rule 1 outbound-interface name eth0
set nat source rule 1 source address 192.168.16.0/24
set nat source rule 1 translation address masquerade

set nat source rule 2 outbound-interface name eth1
set nat source rule 2 source address 192.168.1.0/24
set nat source rule 2 translation address masquerade

# Default Route
set protocols static route 0.0.0.0/0 next-hop 192.168.1.1

# DHCP Configuration
set service dhcp-server listen-interface eth1
set service dhcp-server shared-network-name LAN authoritative
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 lease 86400

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 option default-router 192.168.16.1
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 option domain-name ${domain_name}
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 option domain-search ${domain_name}
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 option name-server 192.168.16.1

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 range 0 start 192.168.16.2
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 range 0 stop 192.168.16.254

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 subnet-id 1

# Static Addresses Configuration
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping control-plane-1 ip-address 192.168.16.12
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping control-plane-1 mac c0:ff:ee:00:00:12

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping control-plane-2 ip-address 192.168.16.13
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping control-plane-2 mac c0:ff:ee:00:00:13

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping control-plane-3 ip-address 192.168.16.14
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping control-plane-3 mac c0:ff:ee:00:00:14

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-1 ip-address 192.168.16.15
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-1 mac c0:ff:ee:00:00:15

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-2 ip-address 192.168.16.16
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-2 mac c0:ff:ee:00:00:16

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-3 ip-address 192.168.16.17
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-3 mac c0:ff:ee:00:00:17

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-4 ip-address 192.168.16.18
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-4 mac c0:ff:ee:00:00:18

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-5 ip-address 192.168.16.19
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-5 mac c0:ff:ee:00:00:19

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-6 ip-address 192.168.16.20
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-6 mac c0:ff:ee:00:00:20

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-7 ip-address 192.168.16.21
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-7 mac c0:ff:ee:00:00:21

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-8 ip-address 192.168.16.22
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-8 mac c0:ff:ee:00:00:22

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-9 ip-address 192.168.16.23
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-9 mac c0:ff:ee:00:00:23

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-10 ip-address 192.168.16.24
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping compute-10 mac c0:ff:ee:00:00:24

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping containers ip-address 192.168.16.2
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping containers mac c0:ff:ee:00:00:02

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping internal-registry ip-address 192.168.16.3
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping internal-registry mac c0:ff:ee:00:00:03

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping quay-registry ip-address 192.168.16.4
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping quay-registry mac c0:ff:ee:00:00:04

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping docker-registry ip-address 192.168.16.5
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping docker-registry mac c0:ff:ee:00:00:05

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping k8s-registry ip-address 192.168.16.6
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping k8s-registry mac c0:ff:ee:00:00:06

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping gcr-registry ip-address 192.168.16.7
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping gcr-registry mac c0:ff:ee:00:00:07

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping ghcr-registry ip-address 192.168.16.8
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping ghcr-registry mac c0:ff:ee:00:00:08

set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping openshift-ci-registry ip-address 192.168.16.9
set service dhcp-server shared-network-name LAN subnet 192.168.16.0/24 static-mapping openshift-ci-registry mac c0:ff:ee:00:00:09

# DNS Configuration
set service dns forwarding listen-address 192.168.16.1
set service dns forwarding listen-address 192.168.1.101
set service dns forwarding name-server 8.8.8.8
set service dns forwarding name-server 8.8.4.4
set service dns forwarding cache-size 10000
set service dns forwarding allow-from 192.168.16.0/24
set service dns forwarding allow-from 192.168.1.0/24

# System Configuration
set system name-server 192.168.16.1

# A records for registries
set service dns forwarding authoritative-domain ${domain_name} records a registry address 192.168.16.3
set service dns forwarding authoritative-domain ${domain_name} records a quay address 192.168.16.4
set service dns forwarding authoritative-domain ${domain_name} records a registry-1 address 192.168.16.5
set service dns forwarding authoritative-domain ${domain_name} records a registry-k8s address 192.168.16.6
set service dns forwarding authoritative-domain ${domain_name} records a gcr address 192.168.16.7
set service dns forwarding authoritative-domain ${domain_name} records a ghcr address 192.168.16.8
set service dns forwarding authoritative-domain ${domain_name} records a openshift-ci address 192.168.16.9

# A records for Talos

set service dns forwarding authoritative-domain talos.${domain_name} records a api address 192.168.1.250
set service dns forwarding authoritative-domain talos.${domain_name} records a api-int address 192.168.16.2
set service dns forwarding authoritative-domain apps.talos.${domain_name} records a any address 192.168.1.250

# PTR records for Talos

set service dns forwarding authoritative-domain 1.168.192.in-addr.arpa records ptr 250 target api.talos.${domain_name}
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 2 target api-int.talos.${domain_name}

# A records for Talos control plane nodes
set service dns forwarding authoritative-domain talos.${domain_name} records a control-plane-1 address 192.168.16.12
set service dns forwarding authoritative-domain talos.${domain_name} records a control-plane-2 address 192.168.16.13
set service dns forwarding authoritative-domain talos.${domain_name} records a control-plane-3 address 192.168.16.14

# PTR records for Talos control plane nodes
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 12 target control-plane-1.talos.${domain_name}
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 13 target control-plane-2.talos.${domain_name}
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 14 target control-plane-3.talos.${domain_name}

# A records for Talos compute nodes
set service dns forwarding authoritative-domain talos.${domain_name} records a compute-1 address 192.168.16.15
set service dns forwarding authoritative-domain talos.${domain_name} records a compute-2 address 192.168.16.16
set service dns forwarding authoritative-domain talos.${domain_name} records a compute-3 address 192.168.16.17
set service dns forwarding authoritative-domain talos.${domain_name} records a compute-4 address 192.168.16.18
set service dns forwarding authoritative-domain talos.${domain_name} records a compute-5 address 192.168.16.19
set service dns forwarding authoritative-domain talos.${domain_name} records a compute-6 address 192.168.16.20
set service dns forwarding authoritative-domain talos.${domain_name} records a compute-7 address 192.168.16.21
set service dns forwarding authoritative-domain talos.${domain_name} records a compute-8 address 192.168.16.22
set service dns forwarding authoritative-domain talos.${domain_name} records a compute-9 address 192.168.16.23
set service dns forwarding authoritative-domain talos.${domain_name} records a compute-10 address 192.168.16.24

# PTR records for Talos compute nodes
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 15 target compute-1.talos.${domain_name}
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 16 target compute-2.talos.${domain_name}
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 17 target compute-3.talos.${domain_name}
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 18 target compute-4.talos.${domain_name}
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 19 target compute-5.talos.${domain_name}
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 20 target compute-6.talos.${domain_name}
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 21 target compute-7.talos.${domain_name}
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 22 target compute-8.talos.${domain_name}
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 23 target compute-9.talos.${domain_name}
set service dns forwarding authoritative-domain 16.168.192.in-addr.arpa records ptr 24 target compute-10.talos.${domain_name}

commit
save
exit
