#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: coffee.sh
# create date: 2013-02-28 12:58:05

coffee -p -c $1 > /tmp/`basename "$1"`.js
./router.convert.sh /tmp/`basename "$1"`.js
