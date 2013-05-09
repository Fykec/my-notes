parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Android 1\_6 联系人研究 {.heading-level2}
-----------------------

原文：
[http://blog.csdn.net/chenyufei1013/archive/2010/12/21/6090278.aspx](http://blog.csdn.net/chenyufei1013/archive/2010/12/21/6090278.aspx)\
 \
 一、简介\

二、数据库分析\

/data/data/com.android.providers.contacts/databases/contacts.db
contacts.db是sqlite数据库文件，使用sqlite管理软件便可打开。该数据库文件中包含了几个和联系人相关的表：contact\_methods，groups，groupmembership，people，phones等。看名称我们大概就知道它们用来保存什么数据，这里要注意的是表contact\_methods用来存储联系人的地址、Email和IM号码。下面就简单的分析一下和联系人关系紧密的几个表。\

三、操作联系人数据\

content://contacts/people
这种格式有点类似于网址，contacts标识了和联系人相关的表，people是上面提到的表people。再比如，email的Uri为：\
 \
 content://contacts/contact\_methods/email
contact\_methods为上面提到的表contact\_methods，而email代表了表contact\_methods中的kind值，也就是说为了获取email方便，为email也设立了逻辑上独立的Uri。\

四、总结\
 \
 \
 \

本文来自CSDN博客，转载请标明出处：[http://blog.csdn.net/chenyufei1013/archive/2010/12/21/6090278.aspx](http://blog.csdn.net/chenyufei1013/archive/2010/12/21/6090278.aspx)
