#!/bin/sh
# author: amoblin
# craete date: Mon Feb  4 23:13:13 2013
# note: the converter for sc template.

echo "<h3>`basename \"$1\"`</h3>"
type=`pygmentize -N "$1"`
pygmentize -f html -O encoding=utf-8,style=default -l "$type" "$1"
