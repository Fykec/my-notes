parent nodes: [Git Config](Git%20Config.html)\
\

git branch {.heading-level2}
----------

create branch\
 \
 git branch \<local\_branch\_name\>\
 git push \<remote\_name\>
\<local\_branch\_name\>:\<remote\_branch\_name\>\
 \
 \
 list remote branches\
 \

[http://gitready.com/intermediate/2009/02/13/list-remote-branches.html](http://gitready.com/intermediate/2009/02/13/list-remote-branches.html)\
 \
 UPDATE: The comments have enlightened me quite a bit…there seems to
always be more than one way to skin a cat using Git. The easiest way is
just to use the git branch commands’ various options. -a shows all local
and remote branches, while -r shows only remote branches.\
 \$ git branch\
 \* master\
 \
 \$ git branch -a\
 \* master

\$ git branch -r

Find branches the commit is on\
 git branch --contains \
 \
 git reflog show --all | grep a871742
