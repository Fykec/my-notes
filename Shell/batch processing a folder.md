# batch processing a folder

2013-04-26 13:04:13

find . -name \*.md -type f -exec pandoc -o {}.txt {} \;

#Rename all *.html.md to *.md
ls -1|sed 's/.html.md$//'|xargs -I {} mv {}.html.md {}.md

[批量重命名文件](http://www.54xue.com/w/85/n-12685.html)


