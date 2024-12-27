# OpenShift HomeLab on libvirt/KVM

Check the youtube video for a full tutorial: [https://youtu.be/VyblhDBO56M](https://youtu.be/VyblhDBO56M)

![HomeLab](homelab.png)

# Requirements
Make sure that your user owns the QEMU processes run by the system instance

``` File: /etc/libvirt/qemu.conf ```
```
user = "nanibot"

group = "libvirt"
```

### Add a route on the VM host for the 192.168.16.0/24 network (preferably via NetworkManager)
```
ip route add 192.168.16.0/24 via 192.168.1.101
```

Make sure that your qcow2 images are resized to atleast 200G

```
qemu-img resize <image.qcow2> 200G
```

### Images
```
1. vyos.iso - VyOS ISO
2. coreos.qcow2 - CoreOS base for OpenShift
3. image.qcow2 - EL9 image for Containers VM
```

### OpenShift Requirements
```
1. openshift-binaries/openshift-install
2. openshift-binaries/oc
3. openshift-configs/install-config.yaml
```

# Provision Infrastructure
```
./driver -a apply -m <module>
```

# Destroy Infrastructure
```
./driver -a destroy -m <module>
```
