parent nodes: [ObjC](ObjC.html)\
\

NS String Memory Management {.heading-level2}
---------------------------

NSString的内存管理 v.2011/12\
 2011年12月5日, 12:31 上午\
 之前写过一个NSString的内存管理\
 \
 不过好像由于之前的理解不深刻，所以写的时候也没有说明太清楚。\
 \
 CS193P的笔记上有如下实例：\
 \
 aString = @"I am a string that 2 years old, man!";\
 这种情况下，字符串储存和管理由系统做，我们不用操心。\
 \
 aString = [NSString stringWithFormat:@"I am a string that %d years old,
man!",2];\
 第二种情况下，我们需要去retain和release这个字符串，系统不管。\
 \
 这是之前写的内容。\
 \

为什么第一种我们不管这个产生的NSString的retain值呢？是因为其实由于我们建立了一个常量，无论我们retain还是release，对于这个对象都是没有意义的，大家可以尝试\
 \
 NSString \*foo = @"ssff";\
 [foo release];\
 [foo release];\

会发现，这样的代码并不会让程序崩溃，而且无论你再release几次都是一样的。\
 \
 第二种其实就是利用NSString
方法来生成一个NSString对象，这个时候我们要招呼到这个对象的retain值，否则就是内存溢出了。而我当时说的并不是一定要releaes或者retain这个stringWithFormat便捷方法产生的对象…
我语文不好，哈哈。便捷方法产生的都是autorelease的对象，谢谢大家的留言！ss
