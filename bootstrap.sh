#!/bin/bash

service sshd start
service mongod start
 
if [[ $1 == "-d" ]]; then
  tail -f /dev/null
fi
 
if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
