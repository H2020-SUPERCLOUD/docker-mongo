# MongoDB Docker Container
- Docker version 1.11.1
- docker-compose version 1.7.1
- MongoDB version 3.0

Launch containers
```
$ docker-compose up --build -d
```
Initialize replica set
```
$ docker exec dockermongo_mon1_1 sh /tmp/init_replset.sh
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
# ./bin/ycsb load mongodb|mongodb-async -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s
# ./bin/ycsb run mongodb|mongodb-async -P workloads/workloada -p mongodb.url=mongodb://mon1:27017/ycsb?w=0 -s
```
