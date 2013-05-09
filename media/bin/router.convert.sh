#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: router.sh
# create date: 2013-02-03 15:52:02

echo "<h3>`basename \"$1\"`</h3>\n"

type=`pygmentize -N "$1"`
isTxt=`basename "$1"|grep "\.txt$"`
if [ "$type" == "text" -a -z "$isTxt" ]; then
    # solution 2:
    # 优点：根据内容进行语法高亮
    # 缺点：能识别格式的文件(type != text或后缀是txt类)，中文乱码
    pygmentize -f html -O encoding=utf-8,outencoding=latin-1,style=default -g "$1"
else
    # solution 1:
    # 优点：没有乱码
    # 缺点：不能根据内容来识别格式，识别为text，使用text高亮，也就是无高亮。
    pygmentize -f html -O encoding=utf-8,style=default -l "$type" "$1"
fi

# solution 3: 适合oh模板。
# 有后缀的文件，中文编码错误。
#cp "$1" /tmp/marboo_tmp_file
#pygmentize -f html \
#    -O encoding=utf-8,outencoding=latin-1,style=default \
#    -g /tmp/marboo_tmp_file
