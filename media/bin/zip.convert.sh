#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: zip.sh
# create date: 2013-03-01 11:27:53

unzip -l $1 > /tmp/`basename "$1"`
./router.convert.sh /tmp/`basename "$1"`
