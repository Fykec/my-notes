#!/bin/sh

echo "<h3>`basename \"$1\"`</h3>"
echo "source code:"
pygmentize -f html -O encoding=utf8,style=default -g "$1"
echo "demo:<br/><br/>"
cat "$1"
