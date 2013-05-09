parent nodes: [ObjC](ObjC.html)\
\

NS Connection retain delegate {.heading-level2}
-----------------------------

NSURLConnection 在下载时调用如下方法，在添加delegate对象时，将自动retain
一次，\
 与一般的delegate有所区别，使用时需要注意。\

(NSURLConnection **)connectionWithRequest:(NSURLRequest**)request delegate:(id)delegate {.heading-level1}
=======================================================================================

Parameters\
 request\
 The URL request to load. The request object is deep-copied as part of
the initialization process. Changes made to request after this method
returns do not affect the request that is used for the loading process.\
 delegate\
 The delegate object for the connection. The delegate will receive
delegate messages as the load progresses. Messages to the delegate will
be sent on the thread that calls this method. For the connection to work
correctly the calling thread’s run loop must be operating in the default
run loop mode.]\
 The connection retains delegate. It releases delegate when the
connection finishes loading, fails, or is canceled.\
 \
 \
 NSURLConnection 会retain delegate，
跟其他的不一样，使用的时候避免循环依赖。
