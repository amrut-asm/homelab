1. Attach external interface (192.168.1.0/24) to VM
2. Run /usr/local/bin/configure-ovs.sh OVNKubernetes
3. Check kubelet -> journalctl -f -u kubelet
3. Approve certificates
4. Detach external interface
5. Reboot node (for safety)

Notes
---
Extra modifications do **not** seem to be working well with MCO -> Remove modifications done
Check logs for pod machine-config-daemon (crictl logs -f <machine-config-daemon-container-id>)
