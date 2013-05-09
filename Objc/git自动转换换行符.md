parent nodes: [Git Config](Git%20Config.html)\
\

git自动转换换行符 {.heading-level2}
-----------------

Linux或Mac系统使用LF作为行结束符，因此你不想 Git
在签出文件时进行自动的转换；当一个以CRLF为行结束符的文件不小心被引入时你肯定想进行修正，把core.autocrlf设置成input来告诉
Git 在提交时把CRLF转换成LF，签出时不转换：\
 \$ git config --global core.autocrlf input\

这样会在Windows系统上的签出文件中保留CRLF，会在Mac和Linux系统上，包括仓库中保留LF。\

