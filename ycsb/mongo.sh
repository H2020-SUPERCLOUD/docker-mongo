#!/bin/bash
cd /YCSB
./bin/ycsb load mongodb-async -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s > /tmp/results/workloada
./bin/ycsb run mongodb -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s  > /tmp/results/workloadb

