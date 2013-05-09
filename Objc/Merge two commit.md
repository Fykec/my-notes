parent nodes: [Git Config](Git%20Config.html)\
\

Merge two commit {.heading-level2}
----------------

[http://blog.logan.tw/2010/12/git-commit.html](http://blog.logan.tw/2010/12/git-commit.html)\
 \
 合併 Git 的 Commit\
 Git 是一個很強大的分散式版本管理系統，因為有了 git，我習慣寫二三十行
code 就 commit 到 local repository。然而如此一來，repository
會充滿一大堆不能正常 compile 的 commit，而且會有一大堆 Fix Typo
之類很沒有用的 commit。有時候會想要把一些 commits
合併之後再上傳給別人，這時候就可以使用 rebase 來合併修改計錄。\
 \
 (不過以下的流程只適合在 local repository 做，一旦上傳到 public
repository，就不適合再 rebase 了！)\
 \
 首先我們要知道過去的 commit 記錄：\
 \
 \$ git log \# 先看每一個 commit 的 log 與 sha1 編號\
 \
 假設我們要把 branch1 的 commitA..commitB 的 commits
合併起來，我們就這樣做（以下的 commitA 與 commitB 皆是指這二個 commit 的
sha1 編號）：\
 \
 \$ git checkout commitB \# 先回到過去某個 commit\
 \
 \$ git reset --soft commitA \# 修改 working directory 的 commit index\
 \
 \$ git commit --amend \# 更新 commit 訊息與時間 (合併
commitA..commitB)\
 \
 \$ git tag tmp \# 記錄合併後的 commit 的 sha1 編號(你直接記 sha1
編號也是可以)\
 \
 \$ git checkout branch1 \# 回到原本 branch 的 HEAD\
 \
 \$ git rebase --onto tmp commitB\
 \# 把 commitB 之前的 commit history 換成合併之後的 commit。\
 \
 \$ git tag -d tmp \# 刪除暫時的 tag\
 --\
 資料來源：\
 How do I combine the first two commits of a Git repository?
