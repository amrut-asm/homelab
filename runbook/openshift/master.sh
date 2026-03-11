#!/bin/bash
set -x

echo "Pinning vCPUs for Master1 (VM1) to NUMA node 1..."
virsh vcpupin okd-master1 0 8   --config
virsh vcpupin okd-master1 1 72  --config
virsh vcpupin okd-master1 2 9   --config
virsh vcpupin okd-master1 3 73  --config
virsh vcpupin okd-master1 4 10  --config
virsh vcpupin okd-master1 5 74  --config
virsh vcpupin okd-master1 6 11  --config
virsh vcpupin okd-master1 7 75  --config
virsh numatune okd-master1 --mode strict --nodeset 1 --config

echo "Pinning vCPUs for Master2 (VM2) to remaining cores on NUMA node 1..."
virsh vcpupin okd-master2 0 12 --config
virsh vcpupin okd-master2 1 76 --config
virsh vcpupin okd-master2 2 13 --config
virsh vcpupin okd-master2 3 77 --config
virsh vcpupin okd-master2 4 14 --config
virsh vcpupin okd-master2 5 78 --config
virsh vcpupin okd-master2 6 15 --config
virsh vcpupin okd-master2 7 79 --config
virsh numatune okd-master2 --mode strict --nodeset 1 --config

echo "Pinning vCPUs for Master3 (VM3) to NUMA node 2..."
virsh vcpupin okd-master3 0 16 --config
virsh vcpupin okd-master3 1 80 --config
virsh vcpupin okd-master3 2 17 --config
virsh vcpupin okd-master3 3 81 --config
virsh vcpupin okd-master3 4 18 --config
virsh vcpupin okd-master3 5 82 --config
virsh vcpupin okd-master3 6 19 --config
virsh vcpupin okd-master3 7 83 --config
virsh numatune okd-master3 --mode strict --nodeset 2 --config

echo "Pinning vCPUs for Bootstrap (VM4) to remaining cores on NUMA node 2..."
virsh vcpupin okd-bootstrap 0 20 --config
virsh vcpupin okd-bootstrap 1 84 --config
virsh vcpupin okd-bootstrap 2 21 --config
virsh vcpupin okd-bootstrap 3 85 --config
virsh vcpupin okd-bootstrap 4 22 --config
virsh vcpupin okd-bootstrap 5 86 --config
virsh vcpupin okd-bootstrap 6 23 --config
virsh vcpupin okd-bootstrap 7 87 --config
virsh numatune okd-bootstrap --mode strict --nodeset 2 --config
