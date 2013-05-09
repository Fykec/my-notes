#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: install.zip.sh
# create date: 2013-03-01 11:24:08

#unzip $1 ~/.marboo/source/media
cp $1 `echo $1 | sed -e 's/install.zip/installed.zip/g'`
