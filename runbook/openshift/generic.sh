#!/bin/bash
set -x

virsh numatune Services --mode strict --nodeset 0 --config
virsh numatune VyOS --mode strict --nodeset 0 --config
