parent nodes: [ObjC](ObjC.html)\
\

Mac中隐藏或显示隐藏的文件 {.heading-level2}
-------------------------

mac系统如何显示和隐藏文件\
 \
 苹果Mac OS
X操作系统下，隐藏文件是否显示有很多种设置方法，最简单的要算在Mac终端输入命令。显示/隐藏Mac隐藏文件命令如下(注意其中的空格并且区分大小写)：\
 \
 显示Mac隐藏文件的命令：defaults write com.apple.finder
AppleShowAllFiles -bool true\
 \
 隐藏Mac隐藏文件的命令：defaults write com.apple.finder
AppleShowAllFiles -bool false\
 \
 \
 或者\
 \
 显示Mac隐藏文件的命令：defaults write com.apple.finder
AppleShowAllFiles YES\
 \
 隐藏Mac隐藏文件的命令：defaults write com.apple.finder
AppleShowAllFiles NO\
 \
 输完单击Enter键，退出终端，重新启动Finder就可以了\
 \

重启Finder：鼠标单击窗口左上角的苹果标志--\>强制退出--\>Finder--\>重新启动！！！！！！！！
