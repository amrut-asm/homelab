#!/bin/bash
set -eux
virsh vcpupin okd-master1 0 8 --config
virsh vcpupin okd-master1 1 9  --config
virsh vcpupin okd-master1 2 10 --config
virsh vcpupin okd-master1 3 11 --config
virsh vcpupin okd-master1 4 12 --config
virsh vcpupin okd-master1 5 13 --config
virsh vcpupin okd-master1 6 14 --config
virsh vcpupin okd-master1 7 15 --config
virsh numatune okd-master1 --mode interleave --nodeset 1 --config

virsh vcpupin okd-master2 0 72 --config
virsh vcpupin okd-master2 1 73 --config
virsh vcpupin okd-master2 2 74 --config
virsh vcpupin okd-master2 3 75 --config
virsh vcpupin okd-master2 4 76 --config
virsh vcpupin okd-master2 5 77 --config
virsh vcpupin okd-master2 6 78 --config
virsh vcpupin okd-master2 7 79 --config
virsh numatune okd-master2 --mode interleave --nodeset 1 --config

virsh vcpupin okd-master3 0 16 --config
virsh vcpupin okd-master3 1 17 --config
virsh vcpupin okd-master3 2 18 --config
virsh vcpupin okd-master3 3 19 --config
virsh vcpupin okd-master3 4 20 --config
virsh vcpupin okd-master3 5 21 --config
virsh vcpupin okd-master3 6 22 --config
virsh vcpupin okd-master3 7 23 --config
virsh numatune okd-master3 --mode interleave --nodeset 2 --config
