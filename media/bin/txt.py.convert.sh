#!/bin/sh
# author: amoblin
# create date: Mon Feb  4 23:13:46 2013
# note: the converter for "run" template.

"$1" > /tmp/marboo_tmp_file 2>&1
echo "<h3>`$ ./basename \"$1\"`</h3>"
pygmentize -f html \
    -O encoding=utf-8,style=default \
    -l text /tmp/marboo_tmp_file
