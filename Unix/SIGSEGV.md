# SIGSEGV

2013-05-10 14:36:08

[WikiPedia Link](http://zh.wikipedia.org/wiki/SIGSEGV)

SIGSEGVAdd to Wunderlist
维基百科，自由的百科全书
SIGSEGV
描述	无效内存引用
默认动作	进程异常终止
SA_SIGINFO宏
SEGV_MAPERR	地址没有映射到对象
SEGV_ACCERR	对映射的对象没有权限
在POSIX兼容的平台上，SIGSEGV是当一个进程执行了一个无效的内存引用，或发生段错误时发送给它的信号。SIGSEGV的符号常量在头文件signal.h中定义。因为在不同平台上，信号数字可能变化，因此符号信号名被使用。通常，它是信号#11。[1]

SIG是信号名的通用前缀。SEGV是segmentation violation（段违例）的缩写。


对于不正确的内存处理（见段错误），计算机程序可能抛出SIGSEGV。操作系统可能使用信号栈向一个处于自然状态的应用程序通告错误，由此，开发者可以使用它来调试程序或处理错误。
在一个程序接收到SIGSEGV时的默认动作是异常终止。这个动作也許會结束进程，但是可能生成一个核心文件以帮助调试，或者执行一些其他特定于某些平台的动作。例如，使用了grsecurity补丁的Linux系统可能记录SIGSEGV信号以监视可能的使用缓存溢出的攻击尝试。

SIGSEGV可以被捕获。也就是说，应用程序可以请求它们想要的动作，以替代默认发生的动作。这样的动作可以是忽略它、调用一个函数，或恢复默认的动作。在一些情形下，忽略SIGSEGV导致未定义行为。[2]
一个应用程序可能处理SIGSEGV的例子是调试器，它可能检查信号栈并通知开发者目前所发生的，以及程序终止的位置。
SIGSEGV通常由操作系统生成，但是有适当权限的用户可以在需要时使用kill系统调用或kill命令（一个用户级程序，或者一个shell内建命令）来向一个进程发送信号。



^ sourceware.org Git - glibc.git/blob - bits/signum.h. 2001-07-06 [2009-11-18T05:37:46+00:00].

^ System Interfaces Chapter 2. 2004年 [2009-11-18T06:51:28+00:00].