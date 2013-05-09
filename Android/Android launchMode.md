parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Android launch Mode {.heading-level2}
-------------------

Android SDK文档学习之Tasks and Back Stack2011-03-28 15:28\
 \
 \

这篇文章主要讲解了android中activity和Task间的关系，通过举一些例子让我们知道根据activity的启动方式可以获得不同的效果。\
 \

activity的启动方式有四种：Standard、singleTop、singleTask、singleInstance\
 \
 standard \

activity的默认启动方式，每一次的跳转都会生成新的实例，不管这个实例是否已经存在，按堆栈的方式在同一个任务里按顺序先进后出\

singleTop\

singleTask\

singleInstance\

关于Activity属性，有一片博客写的很不错，学习之[http://blog.csdn.net/mayingcai1987/archive/2011/02/22/6200909.aspx](http://blog.csdn.net/mayingcai1987/archive/2011/02/22/6200909.aspx)\
 \
 \

