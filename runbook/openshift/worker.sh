#!/bin/bash

# Worker 1 (NUMA node 3)
virsh vcpupin okd-worker1 0 24 --config
virsh vcpupin okd-worker1 1 88 --config
virsh vcpupin okd-worker1 2 25 --config
virsh vcpupin okd-worker1 3 89 --config
virsh vcpupin okd-worker1 4 26 --config
virsh vcpupin okd-worker1 5 90 --config
virsh vcpupin okd-worker1 6 27 --config
virsh vcpupin okd-worker1 7 91 --config
virsh vcpupin okd-worker1 8 28 --config
virsh vcpupin okd-worker1 9 92 --config
virsh vcpupin okd-worker1 10 29 --config
virsh vcpupin okd-worker1 11 93 --config
virsh vcpupin okd-worker1 12 30 --config
virsh vcpupin okd-worker1 13 94 --config
virsh vcpupin okd-worker1 14 31 --config
virsh vcpupin okd-worker1 15 95 --config
virsh numatune okd-worker1 --mode strict --nodeset 3 --config

# Worker 2 (NUMA node 4)
virsh vcpupin okd-worker2 0 32 --config
virsh vcpupin okd-worker2 1 96 --config
virsh vcpupin okd-worker2 2 33 --config
virsh vcpupin okd-worker2 3 97 --config
virsh vcpupin okd-worker2 4 34 --config
virsh vcpupin okd-worker2 5 98 --config
virsh vcpupin okd-worker2 6 35 --config
virsh vcpupin okd-worker2 7 99 --config
virsh vcpupin okd-worker2 8 36 --config
virsh vcpupin okd-worker2 9 100 --config
virsh vcpupin okd-worker2 10 37 --config
virsh vcpupin okd-worker2 11 101 --config
virsh vcpupin okd-worker2 12 38 --config
virsh vcpupin okd-worker2 13 102 --config
virsh vcpupin okd-worker2 14 39 --config
virsh vcpupin okd-worker2 15 103 --config
virsh numatune okd-worker2 --mode strict --nodeset 4 --config

# Worker 3 (NUMA node 5)
virsh vcpupin okd-worker3 0 40 --config
virsh vcpupin okd-worker3 1 104 --config
virsh vcpupin okd-worker3 2 41 --config
virsh vcpupin okd-worker3 3 105 --config
virsh vcpupin okd-worker3 4 42 --config
virsh vcpupin okd-worker3 5 106 --config
virsh vcpupin okd-worker3 6 43 --config
virsh vcpupin okd-worker3 7 107 --config
virsh vcpupin okd-worker3 8 44 --config
virsh vcpupin okd-worker3 9 108 --config
virsh vcpupin okd-worker3 10 45 --config
virsh vcpupin okd-worker3 11 109 --config
virsh vcpupin okd-worker3 12 46 --config
virsh vcpupin okd-worker3 13 110 --config
virsh vcpupin okd-worker3 14 47 --config
virsh vcpupin okd-worker3 15 111 --config
virsh numatune okd-worker3 --mode strict --nodeset 5 --config

# Worker 4 (NUMA node 6)
virsh vcpupin okd-worker4 0 48 --config
virsh vcpupin okd-worker4 1 112 --config
virsh vcpupin okd-worker4 2 49 --config
virsh vcpupin okd-worker4 3 113 --config
virsh vcpupin okd-worker4 4 50 --config
virsh vcpupin okd-worker4 5 114 --config
virsh vcpupin okd-worker4 6 51 --config
virsh vcpupin okd-worker4 7 115 --config
virsh vcpupin okd-worker4 8 52 --config
virsh vcpupin okd-worker4 9 116 --config
virsh vcpupin okd-worker4 10 53 --config
virsh vcpupin okd-worker4 11 117 --config
virsh vcpupin okd-worker4 12 54 --config
virsh vcpupin okd-worker4 13 118 --config
virsh vcpupin okd-worker4 14 55 --config
virsh vcpupin okd-worker4 15 119 --config
virsh numatune okd-worker4 --mode strict --nodeset 6 --config

# Worker 5 (NUMA node 7)
virsh vcpupin okd-worker5 0 56 --config
virsh vcpupin okd-worker5 1 120 --config
virsh vcpupin okd-worker5 2 57 --config
virsh vcpupin okd-worker5 3 121 --config
virsh vcpupin okd-worker5 4 58 --config
virsh vcpupin okd-worker5 5 122 --config
virsh vcpupin okd-worker5 6 59 --config
virsh vcpupin okd-worker5 7 123 --config
virsh vcpupin okd-worker5 8 60 --config
virsh vcpupin okd-worker5 9 124 --config
virsh vcpupin okd-worker5 10 61 --config
virsh vcpupin okd-worker5 11 125 --config
virsh vcpupin okd-worker5 12 62 --config
virsh vcpupin okd-worker5 13 126 --config
virsh vcpupin okd-worker5 14 63 --config
virsh vcpupin okd-worker5 15 127 --config
virsh numatune okd-worker5 --mode strict --nodeset 7 --config
