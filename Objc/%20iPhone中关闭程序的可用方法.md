parent nodes: [ObjC](ObjC.html)\
\

i Phone中关闭程序的可用方法 {.heading-level2}
---------------------------

有时候需要用代码的方式关闭程序，其实功能就像按了home键。\

这两种可以用\
 \
 [cpp] view plaincopy\
 [self performSelector:@selector(notExistCall)]; \
 [cpp] view plaincopy\
 abort(); \
 \
 这两种是私有的，不能通过app store.\
 \
 [cpp] view plaincopy\
 [[UIApplication sharedApplication]
performSelector:@selector(terminateWithSuccess)]; \
 [cpp] view plaincopy\
 exit(0); \

