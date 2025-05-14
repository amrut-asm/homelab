# Numa tuning

## Toplogy
---
1. `8` NUMA Nodes split equally among `2` CPU sockets
2. Each NUMA node has access to `16 vCPUs` and `32 GiBs of RAM`


## Strategy
---
1. Isolate CPUs with kernel cmdline `isolcpus=8-63,72-127`
2. Host is allowed (technically) to schedule workloads on cores `0-7` & `64-71`
3. Use scripts to pin guest VMs onto specific cores (using `virsh vcpupin` and `virsh numatune`)