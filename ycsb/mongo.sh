#!/bin/bash
cd /YCSB
./bin/ycsb load mongodb-async -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s > /tmp/results/workloada-asynch
./bin/ycsb run mongodb -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s  > /tmp/results/workloada
./bin/ycsb load mongodb-async -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s > /tmp/results/workloadb-asynch
./bin/ycsb run mongodb -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s  > /tmp/results/workloadb
./bin/ycsb load mongodb-async -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s > /tmp/results/workloadc-asynch
./bin/ycsb run mongodb -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s  > /tmp/results/workloadc
./bin/ycsb load mongodb-async -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s > /tmp/results/workloadd-asynch
./bin/ycsb run mongodb -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s  > /tmp/results/workloadd
./bin/ycsb load mongodb-async -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s > /tmp/results/workloade-asynch
./bin/ycsb run mongodb -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s  > /tmp/results/workloade
./bin/ycsb load mongodb-async -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s > /tmp/results/workloadf-asynch
./bin/ycsb run mongodb -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s  > /tmp/results/workloadf

