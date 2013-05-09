parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Java Properties文件 {.heading-level2}
-------------------

java中经常用到properties文件，然后通过使用Properties类来解析，这里不再陈述使用properties文件的好处，主要探讨如何在android中使用properties文件！\

Properties pro = new Properties();

pro.load(is);

如果放入到raw文件夹中，可以通过如下方式打开

但是，有的时候我们不想获取android的上下文环境(context)，而是像java中标准的方法加载properties文件，那么我们如何使用呢？请看方法二：\
 方法二：没有上下文的加载！[推荐方式]

pro.load(FileLoad.class.getResourceAsStream("test.properties"));\

其中，FileLoad是该加载方法所在类的类名。test.properties所存放的路径与FileLoad.java为同一包中。\
 \

但是，在android中，当我们打包生成apk后，将apk放入到真正的手机上时，你会找不到test.properties文件，不要惊讶，android中的资源文件是只能存放在assets或者res的子目录里面的，程序包中的资源文件编译后，是会丢失的！那么是不是我们的第二种方法就没法使用了？
当然不是，经过实验发现，将文件放入到assets文件夹里，而在传入路径里面填入文件绝对路径，还是可以引用该文件的。\

代码：pro.load(FileLoad.class.getResourceAsStream("/assets/test.properties"));
\
 \
 注意：其中工程路径的根路径为"/"\
 \
 如此一来，你就可以顺利使用你的Properties文件了！o(∩∩)o...哈哈
