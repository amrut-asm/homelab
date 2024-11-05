#!/bin/bash

# NUMA Tuning for worker VMs
start_cpu1=32
start_cpu2=88
okd_count=1
for ((i=4 ; i<=7 ; i++));
do
	echo "Node $i"
	echo "CPU Set 1"
	echo "---------"

	for ((j=0 ; j<=7 ; j++));
	do
		cpu=$(($start_cpu1 + $j))
		virsh vcpupin okd-worker$okd_count $j $cpu --config
	done
	for ((k=8 ; k<=15 ; k++));
	do
		cpu=$(($start_cpu2 + $k))
		virsh vcpupin okd-worker$okd_count $k $cpu --config
	done
	virsh numatune okd-worker$okd_count --mode interleave --nodeset $i --config
	start_cpu1=$(($start_cpu1 + 8))
	start_cpu2=$(($start_cpu2 + 8))
	okd_count=$(($okd_count+1))
	
	echo ""
done
