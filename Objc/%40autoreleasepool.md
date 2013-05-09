parent nodes: [ObjC](ObjC.html)\
\

@autoreleasepool (only available on 5.x iOS) {.heading-level2}
--------------------------------------------

[http://stackoverflow.com/questions/65427/how-does-the-nsautoreleasepool-autorelease-pool-work](http://stackoverflow.com/questions/65427/how-does-the-nsautoreleasepool-autorelease-pool-work)\
 \
 @autoreleasepool is same withaaaaaaaaa\
 \
 NSAutoreleasePool\* pool = [[NSAutoreleasePool alloc] init];\
 [pool release]\
 \
 NSAutoreleasePool: drain vs. release\
 \
 Since the function of drain and release seem to be causing confusion,
it may be worth clarifying here (although this is covered in the
documentation...).\
 \
 Strictly speaking, from the big picture perspective drain is not
equivalent to release:\
 \
 In a reference-counted environment, drain does perform the same
operations as release, so the two are in that sense equivalent. To
emphasise, this means you do not leak a pool if you use drain rather
than release.\
 \
 In a garbage-collected environment, release is a no-op. Thus it has no
effect. drain, on the other hand, contains a hint to the collector that
it should "collect if needed". Thus in a garbage-collected environment,
using drain helps the system balance collection sweeps.\
 \
 \

[http://www.devdiv.com/forum.php?mod=viewthread&tid=119255](http://www.devdiv.com/forum.php?mod=viewthread&tid=119255)\
 \

自从xcode4.3引入ARC，release这块就有些变化，当你使用ARC，就必须将NSAutoreleasePool的地方换成
@autoreleasepool\
 关于NSAutoreleasePool的解释官方的最清楚\
 Important If you use Automatic Reference Counting (ARC), you cannot use
autorelease pools directly. Instead, you use @autoreleasepool blocks
instead. For example, in place of:\
 NSAutoreleasePool \*pool = [[NSAutoreleasePool alloc] init;\
 // Code benefitting from a local autorelease pool.\
 [pool release];\
 you would write:\
 @autoreleasepool {

}\
 @autoreleasepool blocks are more efficient than using an instance of
NSAutoreleasePool directly; you can also use them even if you do not use
ARC.\
 \

