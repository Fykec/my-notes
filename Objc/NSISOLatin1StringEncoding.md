parent nodes: [ObjC](ObjC.html)\
\

NSISO Latin1String Encoding {.heading-level2}
---------------------------

NSISOLatin1StringEncoding其实就是ISO-8859-1编码\
 \

ISO-8859-1编码是单字节编码，向下兼容ASCII，其编码范围是0x00-0xFF，0x00-0x7F之间完全和ASCII一致，0x80-0x9F之间是控制字符，0xA0-0xFF之间是文字符号。\

ISO-8859-1收录的字符除ASCII收录的字符外，还包括西欧语言、希腊语、泰语、阿拉伯语、希伯来语对应的文字符号。欧元符号出现的比较晚，没有被收录在ISO-8859-1当中。\

　　因为ISO-8859-1编码范围使用了单字节内的所有空间，在支持ISO-8859-1的系统中传输和存储其他任何编码的字节流都不会被抛弃。换言之，把其他任何编码的字节流当作ISO-8859-1编码看待都没有问题。这是个很重要的特性，MySQL数据库默认编码是Latin1就是利用了这个特性。ASCII编码是一个7位的容器，ISO-8859-1编码是一个8位的容器。\
 Latin1是ISO-8859-1的别名，有些环境下写作Latin-1。\
 \

正是由于ISO-8859-1这个特性，我们可以将NSString用NSISOLatin1StringEncoding转化成字节序列，再选用其他编码方式编码，这样可以处理中文乱码，韩文乱码等等问题\
 \

参考：[http://baike.baidu.com/view/2613676.htm](http://baike.baidu.com/view/2613676.htm)
