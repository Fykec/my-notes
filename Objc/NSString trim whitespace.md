parent nodes: [ObjC](ObjC.html)\
\

NS String trim whitespace {.heading-level2}
-------------------------

Remove Whitespace from NSString\
 \
 Jan 28, 2009\
 \
 In Cocoa Touch you always need to write more to achieve the same …\
 \
 NSString **string = @" spaces in front and at the end ";\
 NSString**trimmedString = [string stringByTrimmingCharactersInSet:

NSLog(trimmedString)\
 \
 While such a standard task might look excessively much code to write,
you gain many additional possibilites of what you could want to trim
away. NSCharacterSet also knows these other sets. \

Reference:\

[http://www.cocoanetics.com/2009/01/remove-whitespace-from-nsstring/](http://www.cocoanetics.com/2009/01/remove-whitespace-from-nsstring/)
