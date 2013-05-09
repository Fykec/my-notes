#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: tar.convert.sh
# create date: 2013-03-07 15:13:36
# This file is created from ~/.marboo/source/media/bin/default.init.sh
# 本文件由 ~/.marboo/source/media/bin/default.init.sh　复制而来

name=`basename "$1"`
tar tvf $1 > /tmp/$name
./router.convert.sh /tmp/$name
