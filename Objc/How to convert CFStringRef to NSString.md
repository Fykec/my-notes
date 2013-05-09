parent nodes: [ObjC](ObjC.html)\
\

How to convert CF String Ref to NS String {.heading-level2}
-----------------------------------------

NSString and CFStringRef are "Toll free bridged", meaning that you can
simply typecast between them.\
 \
 For example:\
 \
 CFStringRef aCFString = (CFStringRef)aNSString;\
 \
 works perfectly and transparently. Likewise:\
 \
 NSString **aNSString = (NSString**)aCFString;\
 \
 works as well. The key thing to note is that CoreFoundation will often
return objects with +1 reference counts, meaning that they need to be
released (all CF[Type]Create format functions do this).\
 \
 The nice thing is that in Cocoa you can safely use autorelease or
release to free them up.\
 \

[http://efreedom.com/Question/1-640367/Convert-CFStringRef-NSString](http://efreedom.com/Question/1-640367/Convert-CFStringRef-NSString)
