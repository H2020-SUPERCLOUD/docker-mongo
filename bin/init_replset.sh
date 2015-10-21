#!/usr/bin/env bash

exec_on_container ()
{
  ssh -oStrictHostKeyChecking=no root@$(docker inspect --format="{{.NetworkSettings.IPAddress}}" $(docker ps | grep $1 | awk '{print$1}')) $2
}

BIN="${BASH_SOURCE-$0}"
BIN="$(dirname "${BIN}")"
BASEDIR="$(cd "${BIN}/.."; pwd)"

exec_on_container "mon1" "mongo test < /tmp/replset.js"
exec_on_container "mon2" "echo 'rs.slaveOk()' | mongo test"
exec_on_container "mon3" "echo 'rs.slaveOk()' | mongo test"
