Problem
---
Compute nodes in "NotReady" state and no IP is assigned to the br-ex interface from the DHCP server

Observation
---
ovs-if-phys0 has a problem referencing a interface with invalid UUID. Problem seems to be with the ovs setup performed by the script
under /usr/local/bin/configure-ovs.sh.

Steps to resolve
---
1. Attach external interface (192.168.1.0/24) to VM
2. Run /usr/local/bin/configure-ovs.sh OVNKubernetes
3. Check kubelet -> journalctl -f -u kubelet
3. Approve certificates
4. Detach external interface
5. Reboot node (for safety)

Notes
---
* Extra modifications do **not** seem to be working well with MCO -> Remove modifications done
* Check logs for pod machine-config-daemon (crictl logs -f <machine-config-daemon-container-id>)
