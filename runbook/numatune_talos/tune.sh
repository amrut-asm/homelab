#!/bin/bash
set -x

# Master 1 (NUMA node 1)
virsh vcpupin talos-master1 0 8  --config
virsh vcpupin talos-master1 1 72 --config
virsh vcpupin talos-master1 2 9  --config
virsh vcpupin talos-master1 3 73 --config
virsh numatune talos-master1 --mode strict --nodeset 1 --config

# Master 2 (NUMA node 1)
virsh vcpupin talos-master2 0 10 --config
virsh vcpupin talos-master2 1 74 --config
virsh vcpupin talos-master2 2 11 --config
virsh vcpupin talos-master2 3 75 --config
virsh numatune talos-master2 --mode strict --nodeset 1 --config

# Master 3 (NUMA node 1)
virsh vcpupin talos-master3 0 12 --config
virsh vcpupin talos-master3 1 76 --config
virsh vcpupin talos-master3 2 13 --config
virsh vcpupin talos-master3 3 77 --config
virsh numatune talos-master3 --mode strict --nodeset 1 --config

# GNS3
virsh vcpupin gns3 0 14 --config
virsh vcpupin gns3 1 78 --config
virsh vcpupin gns3 2 15 --config
virsh vcpupin gns3 3 79 --config
virsh numatune gns3 --mode strict --nodeset 1 --config

# VyOS and Services
# virsh vcpupin VyOS 0 64 --config
# virsh vcpupin VyOS 1 65  --config
# virsh vcpupin VyOS 2 66 --config
# virsh vcpupin VyOS 3 67 --config
# virsh numatune VyOS --mode strict --nodeset 0 --config
# 
# virsh vcpupin Services 0 68 --config
# virsh vcpupin Services 1 69  --config
# virsh vcpupin Services 2 70 --config
# virsh vcpupin Services 3 71 --config
# virsh numatune Services --mode strict --nodeset 0 --config

# Worker 6 (NUMA node 2)
virsh vcpupin talos-worker6 0 16 --config
virsh vcpupin talos-worker6 1 80 --config
virsh vcpupin talos-worker6 2 17 --config
virsh vcpupin talos-worker6 3 81 --config
virsh vcpupin talos-worker6 4 18 --config
virsh vcpupin talos-worker6 5 82 --config
virsh vcpupin talos-worker6 6 19 --config
virsh vcpupin talos-worker6 7 83 --config
virsh vcpupin talos-worker6 8 20 --config
virsh vcpupin talos-worker6 9 84 --config
virsh vcpupin talos-worker6 10 21 --config
virsh vcpupin talos-worker6 11 85 --config
virsh vcpupin talos-worker6 12 22 --config
virsh vcpupin talos-worker6 13 86 --config
virsh vcpupin talos-worker6 14 23 --config
virsh vcpupin talos-worker6 15 87 --config
virsh numatune talos-worker6 --mode strict --nodeset 2 --config

# Worker 1 (NUMA node 3)
virsh vcpupin talos-worker1 0 24 --config
virsh vcpupin talos-worker1 1 88 --config
virsh vcpupin talos-worker1 2 25 --config
virsh vcpupin talos-worker1 3 89 --config
virsh vcpupin talos-worker1 4 26 --config
virsh vcpupin talos-worker1 5 90 --config
virsh vcpupin talos-worker1 6 27 --config
virsh vcpupin talos-worker1 7 91 --config
virsh vcpupin talos-worker1 8 28 --config
virsh vcpupin talos-worker1 9 92 --config
virsh vcpupin talos-worker1 10 29 --config
virsh vcpupin talos-worker1 11 93 --config
virsh vcpupin talos-worker1 12 30 --config
virsh vcpupin talos-worker1 13 94 --config
virsh vcpupin talos-worker1 14 31 --config
virsh vcpupin talos-worker1 15 95 --config
virsh numatune talos-worker1 --mode strict --nodeset 3 --config

# Worker 2 (NUMA node 4)
virsh vcpupin talos-worker2 0 32 --config
virsh vcpupin talos-worker2 1 96 --config
virsh vcpupin talos-worker2 2 33 --config
virsh vcpupin talos-worker2 3 97 --config
virsh vcpupin talos-worker2 4 34 --config
virsh vcpupin talos-worker2 5 98 --config
virsh vcpupin talos-worker2 6 35 --config
virsh vcpupin talos-worker2 7 99 --config
virsh vcpupin talos-worker2 8 36 --config
virsh vcpupin talos-worker2 9 100 --config
virsh vcpupin talos-worker2 10 37 --config
virsh vcpupin talos-worker2 11 101 --config
virsh vcpupin talos-worker2 12 38 --config
virsh vcpupin talos-worker2 13 102 --config
virsh vcpupin talos-worker2 14 39 --config
virsh vcpupin talos-worker2 15 103 --config
virsh numatune talos-worker2 --mode strict --nodeset 4 --config

# Worker 3 (NUMA node 5)
virsh vcpupin talos-worker3 0 40 --config
virsh vcpupin talos-worker3 1 104 --config
virsh vcpupin talos-worker3 2 41 --config
virsh vcpupin talos-worker3 3 105 --config
virsh vcpupin talos-worker3 4 42 --config
virsh vcpupin talos-worker3 5 106 --config
virsh vcpupin talos-worker3 6 43 --config
virsh vcpupin talos-worker3 7 107 --config
virsh vcpupin talos-worker3 8 44 --config
virsh vcpupin talos-worker3 9 108 --config
virsh vcpupin talos-worker3 10 45 --config
virsh vcpupin talos-worker3 11 109 --config
virsh vcpupin talos-worker3 12 46 --config
virsh vcpupin talos-worker3 13 110 --config
virsh vcpupin talos-worker3 14 47 --config
virsh vcpupin talos-worker3 15 111 --config
virsh numatune talos-worker3 --mode strict --nodeset 5 --config

# Worker 4 (NUMA node 6)
virsh vcpupin talos-worker4 0 48 --config
virsh vcpupin talos-worker4 1 112 --config
virsh vcpupin talos-worker4 2 49 --config
virsh vcpupin talos-worker4 3 113 --config
virsh vcpupin talos-worker4 4 50 --config
virsh vcpupin talos-worker4 5 114 --config
virsh vcpupin talos-worker4 6 51 --config
virsh vcpupin talos-worker4 7 115 --config
virsh vcpupin talos-worker4 8 52 --config
virsh vcpupin talos-worker4 9 116 --config
virsh vcpupin talos-worker4 10 53 --config
virsh vcpupin talos-worker4 11 117 --config
virsh vcpupin talos-worker4 12 54 --config
virsh vcpupin talos-worker4 13 118 --config
virsh vcpupin talos-worker4 14 55 --config
virsh vcpupin talos-worker4 15 119 --config
virsh numatune talos-worker4 --mode strict --nodeset 6 --config

# Worker 5 (NUMA node 7)
virsh vcpupin talos-worker5 0 56 --config
virsh vcpupin talos-worker5 1 120 --config
virsh vcpupin talos-worker5 2 57 --config
virsh vcpupin talos-worker5 3 121 --config
virsh vcpupin talos-worker5 4 58 --config
virsh vcpupin talos-worker5 5 122 --config
virsh vcpupin talos-worker5 6 59 --config
virsh vcpupin talos-worker5 7 123 --config
virsh vcpupin talos-worker5 8 60 --config
virsh vcpupin talos-worker5 9 124 --config
virsh vcpupin talos-worker5 10 61 --config
virsh vcpupin talos-worker5 11 125 --config
virsh vcpupin talos-worker5 12 62 --config
virsh vcpupin talos-worker5 13 126 --config
virsh vcpupin talos-worker5 14 63 --config
virsh vcpupin talos-worker5 15 127 --config
virsh numatune talos-worker5 --mode strict --nodeset 7 --config
