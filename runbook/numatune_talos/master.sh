#!/bin/bash
set -eux
virsh vcpupin talos-master1 0 8 --config
virsh vcpupin talos-master1 1 9  --config
virsh vcpupin talos-master1 2 10 --config
virsh vcpupin talos-master1 3 11 --config
virsh numatune talos-master1 --mode interleave --nodeset 1 --config

virsh vcpupin talos-master2 0 72 --config
virsh vcpupin talos-master2 1 73 --config
virsh vcpupin talos-master2 2 74 --config
virsh vcpupin talos-master2 3 75 --config
virsh numatune talos-master2 --mode interleave --nodeset 1 --config

virsh vcpupin talos-master3 0 16 --config
virsh vcpupin talos-master3 1 17 --config
virsh vcpupin talos-master3 2 18 --config
virsh vcpupin talos-master3 3 19 --config
virsh numatune talos-master3 --mode interleave --nodeset 2 --config
