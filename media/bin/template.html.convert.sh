#!/bin/sh
# author: amoblin
# create date: Mon Feb  4 23:09:46 2013
# note: the converter for file in media/templates.

echo "<h3>`basename \"$1\"`</h3>"
echo "source code:"
type=`pygmentize -N "$1"`
pygmentize -f html -O encoding=utf-8,style=default -l "$type" "$1"
echo "demo:<br/><br/>"
cat "$1"
