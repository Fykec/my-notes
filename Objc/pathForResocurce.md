parent nodes: [ObjC](ObjC.html)\
\

path For Resocurce {.heading-level2}
------------------

[http://stackoverflow.com/questions/13147124/nsbundle-pathforresource-not-working](http://stackoverflow.com/questions/13147124/nsbundle-pathforresource-not-working)\
 \
 should not\
 pathToImage = [[NSBundle mainBundle] pathForResource:[self
primitiveValueForKey:@"cLocalImageName"] ofType:@".png"];\
 \
 should\
 pathToImage = [[NSBundle mainBundle] pathForResource:[self
primitiveValueForKey:@"cLocalImageName"] ofType:@"png"];\
 \
 in iOS 6 both can work, in iOS 5 only the second can work
