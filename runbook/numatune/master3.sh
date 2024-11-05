#!/bin/bash
set -eux
virsh vcpupin okd-master3 0 24 --config
virsh vcpupin okd-master3 1 25 --config
virsh vcpupin okd-master3 2 26 --config
virsh vcpupin okd-master3 3 27 --config
virsh vcpupin okd-master3 4 28 --config
virsh vcpupin okd-master3 5 29 --config
virsh vcpupin okd-master3 6 30 --config
virsh vcpupin okd-master3 7 31 --config
virsh numatune okd-master3 --mode interleave --nodeset 3 --config
