#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: mbe.json.sh
# create date: 2013-03-01 10:02:37

./router.convert.sh $1

args=`python -c "import os,sys,json;source=os.path.join(os.path.expanduser('~'), '.marboo/source');print '%s%s' % (source, (' %s' % source).join(json.loads(open(sys.argv[1]).read())['files']))" $1`
#echo zip $1.zip $args

name=`basename "$1"`
zip `echo $1 | sed -e 's/.mbe.json/.mbe.zip/g'` $args > /tmp/$name.txt
./router.convert.sh /tmp/$name.txt
