#!/bin/bash
# NUMA Tuning for master VMs
start_cpu1=8
start_cpu2=72
okd_count=1
master_count=3
for ((i=1 ; i<=1 ; i++));
do
	echo "Node $i"
	echo "CPU Set 1"
	echo "---------"

	for ((j=0 ; j<=7 ; j++));
	do
		cpu=$(($start_cpu1 + $j))
		virsh vcpupin okd-master$okd_count $j $cpu --config
	done
	virsh numatune okd-master$okd_count --mode interleave --nodeset $i --config
	start_cpu1=$(($cpu + 1))
	okd_count=$(($okd_count+1))
	
	if [ $okd_count -gt 3 ]
	then
		continue
	fi

	echo "Node $i"
	echo "CPU Set 2"
	echo "---------"
	for ((k=0 ; k<=7; k++));
	do
		cpu=$(($start_cpu2 + $k))
		virsh vcpupin okd-master$okd_count $k $cpu --config
	done
	virsh numatune okd-master$okd_count --mode interleave --nodeset $i --config
	start_cpu2=$(($cpu + 1))
	okd_count=$(($okd_count+1))
done
