#!/bin/bash
set -eux
virsh vcpupin talos-master1 0 8 --config
virsh vcpupin talos-master1 1 9  --config
virsh vcpupin talos-master1 2 10 --config
virsh vcpupin talos-master1 3 11 --config
virsh numatune talos-master1 --mode interleave --nodeset 1 --config

virsh vcpupin talos-master2 0 12 --config
virsh vcpupin talos-master2 1 13 --config
virsh vcpupin talos-master2 2 14 --config
virsh vcpupin talos-master2 3 15 --config
virsh numatune talos-master2 --mode interleave --nodeset 1 --config

virsh vcpupin talos-master3 0 72 --config
virsh vcpupin talos-master3 1 73 --config
virsh vcpupin talos-master3 2 74 --config
virsh vcpupin talos-master3 3 75 --config
virsh numatune talos-master3 --mode interleave --nodeset 1 --config

virsh vcpupin gns3 0 76 --config
virsh vcpupin gns3 1 77 --config
virsh vcpupin gns3 2 78 --config
virsh vcpupin gns3 3 79 --config
virsh numatune gns3 --mode interleave --nodeset 1 --config

# Worker 6
virsh vcpupin talos-worker6 0 16 --config
virsh vcpupin talos-worker6 1 17 --config
virsh vcpupin talos-worker6 2 18 --config
virsh vcpupin talos-worker6 3 19 --config
virsh vcpupin talos-worker6 4 20 --config
virsh vcpupin talos-worker6 5 21 --config
virsh vcpupin talos-worker6 6 22 --config
virsh vcpupin talos-worker6 7 23 --config
virsh vcpupin talos-worker6 8 80 --config
virsh vcpupin talos-worker6 9 81 --config
virsh vcpupin talos-worker6 10 82 --config
virsh vcpupin talos-worker6 11 83 --config
virsh vcpupin talos-worker6 12 84 --config
virsh vcpupin talos-worker6 13 85 --config
virsh vcpupin talos-worker6 14 86 --config
virsh vcpupin talos-worker6 15 87 --config
virsh numatune talos-worker6 --mode interleave --nodeset 2 --config

# Worker 1
virsh vcpupin talos-worker1 0 24 --config
virsh vcpupin talos-worker1 1 25 --config
virsh vcpupin talos-worker1 2 26 --config
virsh vcpupin talos-worker1 3 27 --config
virsh vcpupin talos-worker1 4 28 --config
virsh vcpupin talos-worker1 5 29 --config
virsh vcpupin talos-worker1 6 30 --config
virsh vcpupin talos-worker1 7 31 --config
virsh vcpupin talos-worker1 8 88 --config
virsh vcpupin talos-worker1 9 89 --config
virsh vcpupin talos-worker1 10 90 --config
virsh vcpupin talos-worker1 11 91 --config
virsh vcpupin talos-worker1 12 92 --config
virsh vcpupin talos-worker1 13 93 --config
virsh vcpupin talos-worker1 14 94 --config
virsh vcpupin talos-worker1 15 95 --config
virsh numatune talos-worker1 --mode interleave --nodeset 3 --config

# Worker 2
virsh vcpupin talos-worker2 0 32 --config
virsh vcpupin talos-worker2 1 33 --config
virsh vcpupin talos-worker2 2 34 --config
virsh vcpupin talos-worker2 3 35 --config
virsh vcpupin talos-worker2 4 36 --config
virsh vcpupin talos-worker2 5 37 --config
virsh vcpupin talos-worker2 6 38 --config
virsh vcpupin talos-worker2 7 39 --config
virsh vcpupin talos-worker2 8 96 --config
virsh vcpupin talos-worker2 9 97 --config
virsh vcpupin talos-worker2 10 98 --config
virsh vcpupin talos-worker2 11 99 --config
virsh vcpupin talos-worker2 12 100 --config
virsh vcpupin talos-worker2 13 101 --config
virsh vcpupin talos-worker2 14 102 --config
virsh vcpupin talos-worker2 15 103 --config
virsh numatune talos-worker2 --mode interleave --nodeset 4 --config

# Worker 3
virsh vcpupin talos-worker3 0 40 --config
virsh vcpupin talos-worker3 1 41 --config
virsh vcpupin talos-worker3 2 42 --config
virsh vcpupin talos-worker3 3 43 --config
virsh vcpupin talos-worker3 4 44 --config
virsh vcpupin talos-worker3 5 45 --config
virsh vcpupin talos-worker3 6 46 --config
virsh vcpupin talos-worker3 7 47 --config
virsh vcpupin talos-worker3 8 104 --config
virsh vcpupin talos-worker3 9 105 --config
virsh vcpupin talos-worker3 10 106 --config
virsh vcpupin talos-worker3 11 107 --config
virsh vcpupin talos-worker3 12 108 --config
virsh vcpupin talos-worker3 13 109 --config
virsh vcpupin talos-worker3 14 110 --config
virsh vcpupin talos-worker3 15 111 --config
virsh numatune talos-worker3 --mode interleave --nodeset 5 --config

# Worker 4
virsh vcpupin talos-worker4 0 48 --config
virsh vcpupin talos-worker4 1 49 --config
virsh vcpupin talos-worker4 2 50 --config
virsh vcpupin talos-worker4 3 51 --config
virsh vcpupin talos-worker4 4 52 --config
virsh vcpupin talos-worker4 5 53 --config
virsh vcpupin talos-worker4 6 54 --config
virsh vcpupin talos-worker4 7 55 --config
virsh vcpupin talos-worker4 8 112 --config
virsh vcpupin talos-worker4 9 113 --config
virsh vcpupin talos-worker4 10 114 --config
virsh vcpupin talos-worker4 11 115 --config
virsh vcpupin talos-worker4 12 116 --config
virsh vcpupin talos-worker4 13 117 --config
virsh vcpupin talos-worker4 14 118 --config
virsh vcpupin talos-worker4 15 119 --config
virsh numatune talos-worker4 --mode interleave --nodeset 6 --config

# Worker 5
virsh vcpupin talos-worker5 0 56 --config
virsh vcpupin talos-worker5 1 57 --config
virsh vcpupin talos-worker5 2 58 --config
virsh vcpupin talos-worker5 3 59 --config
virsh vcpupin talos-worker5 4 60 --config
virsh vcpupin talos-worker5 5 61 --config
virsh vcpupin talos-worker5 6 62 --config
virsh vcpupin talos-worker5 7 63 --config
virsh vcpupin talos-worker5 8 120 --config
virsh vcpupin talos-worker5 9 121 --config
virsh vcpupin talos-worker5 10 122 --config
virsh vcpupin talos-worker5 11 123 --config
virsh vcpupin talos-worker5 12 124 --config
virsh vcpupin talos-worker5 13 125 --config
virsh vcpupin talos-worker5 14 126 --config
virsh vcpupin talos-worker5 15 127 --config
virsh numatune talos-worker5 --mode interleave --nodeset 7 --config
