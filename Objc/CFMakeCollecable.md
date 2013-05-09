parent nodes: [ObjC](ObjC.html)\
\

CF Make Collecable {.heading-level2}
------------------

This behavioral difference gives you some additional flexibility in a
garbage collected environment. In a non-garbage-collected application
you call CFRelease() only when you want to relinquish ownership; in a
garbage-collected application you may call CFRelease() immediately after
allocation and the object will be collected when appropriate. Better
still, though, you can use CFMakeCollectable instead of CFRelease.
CFMakeCollectable calls CFRelease, but has two supplementary features:
first, it halts the program if the object wasn't allocated in the
scanned zone; second, it’s a no-op in a reference counted environment.
(In addition, it more clearly signals your intent.) For example:\
 CFStringRef myCFString = CFMakeCollectable(CFStringCreate...(...)); You
can also use NSMakeCollectable. This is exactly the same as
CFMakeCollectable except that it\
 returns an id—you can use this to avoid the need for casting, as
illustrated in the following example: id myNSString =
NSMakeCollectable(CFStringCreate...(...)); You could imagine the
implementation of CFMakeCollectable as being similar to this: id
CFMakeCollectable(CFTypeRef object)\
 {\
 CFAllocatorRef allocator = CFGetAllocator(object);\
 if ((allocator != kCFAllocatorDefault) && (allocator !=
kCFAllocatorSystemDefault)) {\
 Note: You can take advantage of this feature if you have to store a
reference into non-scanned memory and cannot (and should not) guarantee
that a valid reference exists elsewhere. This is similar to creating a
JNI Global Reference to hold onto a Java object from C code. See also,
though, disableCollectorForPointer:.\
 // Register an error.\
 } CFRelease([(id)object retain]); return object;\
 }
