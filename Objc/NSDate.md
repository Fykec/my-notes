parent nodes: [ASIHTTPRequest](ASIHTTPRequest.html) |
[NSDate](NSDate.html) | [ObjC](ObjC.html)\
\

NS Date {.heading-level2}
-------

我自己有一个认识的错误就是，NSDate只能精确到秒，以前有一个用法错误，大家可以看一下，不要犯了。\
 \
 long long timeStamp =(long long)[[NSDate date] timeIntervalSince1970]
\* 1000.0;\
 \
 以前我经常这样写，这时只精确到秒，这不能怪 [NSDate](NSDate.html)，因为
（long long）先强转了 timeInterval的结果，而不是timeInterval的错。\
 系统定义中DSDate可以精确到秒以下，（当然可能时间不准确），\
 (NSTimeInterval)timeIntervalSince1970;\
 typedef double NSTimeInterval;\
 所以timeInterval返回的是double，小数点后面是有数字的。\
 \
 正确写法如下\
 \
 long long timeStamp =(long long)([[NSDate date] timeIntervalSince1970]
\* 1000.0);\
 \
 \
 \
 Below two case not the same result\
 \
 (1) everty time's postion is not the same\
 for(int index =0; index \< [array count]; index++)

{

}\

(2)may in debug mode position is not the same, but in release mode, not
load log system, the posiotion is the same\
 for(int index =0; index \< [array count]; index++)

{

}\
 \

Another workable case \
 (3)\
 \
 long long timeStamp = (long long)([[NSDate date] timeIntervalSince1970]
\* 1000.0);

for(int index =0; index \< [array count]; index++)\
 {

}
