parent nodes: [ObjC](ObjC.html)\
\

@Property {.heading-level2}
---------

self.xxproperty
在objc中是发消息，而不是类调用子变量，不同与java，所以要这么用之前，一定要\
 1. in .h do @Property （）xxProperty\
 2. in .m do @synthesize xxProperty;\
 \
 retain 在setter方法中会retain一次\
 assign 在setter方法中不会retain
