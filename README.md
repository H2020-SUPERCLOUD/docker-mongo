# MongoDB Docker Container
- MongoDB 3.0
- YCSB 0.3.1

Launch containers
```
$ docker-compose up -d
$ ./update_docker_hosts.sh
```
Initialize replica set
```
$ ./bin/init_replset.sh
```
In order to work in container, run 'docker exec' command
```
$ docker exec -it dockermongo_mon1_1 bash
```
To run YCSB
```
$ docker exec -it dockermongo_ycsb_1 bash
```
Use `mongodb` for synchronous driver, `mongodb-async` for asynchronous driver.
```
# cd /YCSB
# ./bin/ycsb load mongodb|mongodb-async -P workloads/workloada -p mongodb.url=mongodb://mon1.containers.dev:27017/ycsb?w=0 -s
# ./bin/ycsb run mongodb|mongodb-async -P workloads/workloada -p mongodb.url=mongodb://mon1.containers.dev:27017/ycsb?w=0 -s
```
