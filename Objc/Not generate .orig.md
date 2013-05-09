parent nodes: [Git Config](Git%20Config.html)\
\

Not generate .orig {.heading-level2}
------------------

git config --global mergetool.keepBackup false\
 \
 对于已有的.orig.\
 如果是已经Commit了的orig，\
 Git rm -- \*.orig\
 如果是是不在Commit里的\
 Git clean –f\
 (注意先把新增的文件commit， Git clean的是清除所有untagged /untracked
文件， 新增的本地没有commit的文件都会被Clean）
