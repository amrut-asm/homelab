#!/bin/bash
set -eux
virsh vcpupin okd-worker5 0 16 --config
virsh vcpupin okd-worker5 1 17 --config
virsh vcpupin okd-worker5 2 18 --config
virsh vcpupin okd-worker5 3 19 --config
virsh vcpupin okd-worker5 4 20 --config
virsh vcpupin okd-worker5 5 21 --config
virsh vcpupin okd-worker5 6 22 --config
virsh vcpupin okd-worker5 7 23 --config
virsh vcpupin okd-worker5 8 80 --config
virsh vcpupin okd-worker5 9 81 --config
virsh vcpupin okd-worker5 10 82 --config
virsh vcpupin okd-worker5 11 83 --config
virsh vcpupin okd-worker5 12 84 --config
virsh vcpupin okd-worker5 13 85 --config
virsh vcpupin okd-worker5 14 86 --config
virsh vcpupin okd-worker5 15 87 --config
virsh numatune okd-worker5 --mode interleave --nodeset 2 --config
