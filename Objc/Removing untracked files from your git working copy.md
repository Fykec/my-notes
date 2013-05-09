parent nodes: \
\

Removing untracked files from your git working copy {.heading-level2}
---------------------------------------------------

[http://stackoverflow.com/questions/61212/removing-untracked-files-from-your-git-working-copy](http://stackoverflow.com/questions/61212/removing-untracked-files-from-your-git-working-copy)\
 \
 git clean -f\
 If you want to also remove directories, run git clean -f -d.\
 \
 If you just want to remove ignored files, run git clean -f -X.\
 \
 If you want to remove ignored as well as non-ignored files, run git
clean -f -x.\
 \
 Note the case difference on the X for the two latter commands.\
 \
 Unless you specify -f and clean.requireForce is set to "true" (the
default) in your configuration, nothing will actually happen, with a
recent enough version of git.\
 \
 Note that as of git-1.6.0, the dashed style of writing git commands
(ie, git-clean instead of git clean) is obsoleted.s
