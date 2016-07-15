#!/usr/bin/env bash

case $1 in
  start)
    /bin/mongod -f /etc/lotto-daemon.yml
    ;;
  stop)
    /bin/mongod -f /etc/lotto-daemon.yml --shutdown
    ;;
esac
