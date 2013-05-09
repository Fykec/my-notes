parent nodes: [ObjC](ObjC.html)\
\

for "in" keyword loop notice {.heading-level2}
----------------------------

release array in "in" loop cause crash // NSObject **object =\
 [[NSObject alloc] init]; // NSValue** value = [NSValue\
 valueWithNonretainedObject:object]; // NSMutableArray **hello =\
 [NSMutableArray arrayWithObject:value]; //@[@"dhjskalh", @"sfaklhg"]\
 //[[[NSString alloc] initWithString:@"hello"] autorelease] // for\
 (NSValue** he in hello) // { // [hello release]; // }\

NSObject **object = [[NSObject alloc] init];\
 NSValue** value = [NSValue valueWithNonretainedObject:object];\
 NSMutableArray **hello = [NSMutableArray arrayWithObject:value];
//@[@"dhjskalh", @"sfaklhg"] //[[[NSString alloc]
initWithString:@"hello"] autorelease]\
 int count = [hello count];\
 for (int i = 0; i \< count; i++)\
 {**

}\
 \
 \
 \
 \
 \
 Solution\
 \
 -(void)performSelectorOnDelegates:(SEL)selector withObject:(id)object\
 {\
 //Solution 1\
 int count = [\_delegates count];\
 for(int i = 0; i \< count; i++)\
 {

NSValue\* value = [\_delegates objectAtIndex:i];\
 id delegate = [value nonretainedObjectValue];\
 if([delegate respondsToSelector:selector])\
 {

}

}\
 \
 //Solution 2\
 //this call may in "in" loop release the array so need retain array
first\
 \
 // [\_delegates retain];\
 // for(NSValue value in \_delegates)

// {\
 // id delegate = [value nonretainedObjectValue];\
 // if([delegate respondsToSelector:selector])\
 // {\
 // [delegate performSelector:selector withObject:object];\
 // }\
 // }\
 // [\_delegates release];\
 }
