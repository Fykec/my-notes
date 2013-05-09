parent nodes: [Git Config](Git%20Config.html)\
\

git tag {.heading-level2}
-------

\# 1. create tag to server\
 \
 git tag \
 git push origin --tags\
 \
 \#2. checkout tag\
 \
 git reset --hard \
 \
 \#3. delete tag (have force push 权限)\
 \
 git tag -d \#delete local\
 git push origin :refs/tags/ \#delete remote \
 \
 \
 //Rename tag\
 git tag new old\
 git tag -d old\
 git push origin :refs/tags/old
