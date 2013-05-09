parent nodes: [ObjC](ObjC.html)\
\

atos Check Crash symbol {.heading-level2}
-----------------------

[http://172.16.7.253/dolphindistribution/builds/](http://172.16.7.253/dolphindistribution/builds/)
去下载相应的build。\
 \
 通过如下命令可以把函数地址转化为对应的symbol：\
 \
 进入Dolphin.app所在目录\
 example /Users/jjyin/Desktop/Symbol\_Analysize/iPad/english/3.5/Dolphin
1-17-12 8.48 PM.xcarchive/Products/Applications\
 （该app必须和crash的app是同一个build）。\
 如下命令。\
 atos -arch armv7 -o 'Dolphin.app'/'Dolphin' 0x000b4582
