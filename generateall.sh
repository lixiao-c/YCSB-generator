#!/bin/bash

SKEW=$1
NUM=$2

./ycsb.sh workloadd_16 $NUM $NUM "/home/YCSB_DATA2/workloadd/d_15M_16_load" "/home/YCSB_DATA2/workloadd/d_16_run"
./ycsb.sh workloadb_16 $NUM $NUM "/home/YCSB_DATA2/$SKEW/b_16_load" "/home/YCSB_DATA2/$SKEW/b_16_run"
./ycsb.sh workloadc_16 $NUM $NUM "/home/YCSB_DATA2/$SKEW/c_16_load" "/home/YCSB_DATA2/$SKEW/c_16_run"
./ycsb.sh workload85r_16 $NUM $NUM "/home/YCSB_DATA2/$SKEW/85r_16_load" "/home/YCSB_DATA2/$SKEW/85r_16_run"
./ycsb.sh workloada_16 $NUM $NUM "/home/YCSB_DATA2/$SKEW/a_16_load" "/home/YCSB_DATA2/$SKEW/a_16_run"
./ycsb.sh workload100w_16 $NUM $NUM  "/home/YCSB_DATA2/$SKEW/100w_16_load" "/home/YCSB_DATA2/$SKEW/100w_16_run"



