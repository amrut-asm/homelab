#!/bin/bash
set -eux
virsh vcpupin okd-sno 0 16 --config
virsh vcpupin okd-sno 1 17 --config
virsh vcpupin okd-sno 2 18 --config
virsh vcpupin okd-sno 3 19 --config
virsh vcpupin okd-sno 4 20 --config
virsh vcpupin okd-sno 5 21 --config
virsh vcpupin okd-sno 6 22 --config
virsh vcpupin okd-sno 7 23 --config
virsh vcpupin okd-sno 8 80 --config
virsh vcpupin okd-sno 9 81 --config
virsh vcpupin okd-sno 10 82 --config
virsh vcpupin okd-sno 11 83 --config
virsh vcpupin okd-sno 12 84 --config
virsh vcpupin okd-sno 13 85 --config
virsh vcpupin okd-sno 14 86 --config
virsh vcpupin okd-sno 15 87 --config
virsh numatune okd-sno --mode interleave --nodeset 2 --config
