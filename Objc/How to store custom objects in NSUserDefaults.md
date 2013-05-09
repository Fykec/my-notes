parent nodes: [ObjC](ObjC.html)\
\

How to store custom objects in NS User Defaults {.heading-level2}
-----------------------------------------------

[http://stackoverflow.com/questions/2315948/how-to-store-custom-objects-in-nsuserdefaults](http://stackoverflow.com/questions/2315948/how-to-store-custom-objects-in-nsuserdefaults)\
 \
 \
 On your Player class, implement the following two methods (substituting
calls to encodeObject with something relevant to your own object):\
 \
 - (void)encodeWithCoder:(NSCoder **)encoder {**

}\
 \
 - (id)initWithCoder:(NSCoder )decoder {

if((self = [super init])) {

}\
 return self;

}\
 Reading and writing from NSUserDefaults\
 \
 - (void)saveCustomObject:(MyCustomObject **)obj {**

}\
 \
 - (MyCustomObject )loadCustomObjectWithKey:(NSString \*)key {

}\
 Code shamelessly borrowed from:
[http://www.iphonedevsdk.com/forum/iphone-sdk-development/16205-saving-class-nsuserdefaults.html](http://www.iphonedevsdk.com/forum/iphone-sdk-development/16205-saving-class-nsuserdefaults.html)
