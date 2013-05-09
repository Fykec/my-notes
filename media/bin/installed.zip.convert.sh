#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: installed.zip.convert.sh
# create date: 2013-03-01 12:08:04

rm -f `echo $1 | sed -e 's/installed.zip/install.zip/g'`
sh zip.convert.sh $1
