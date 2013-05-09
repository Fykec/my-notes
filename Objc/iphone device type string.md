parent nodes: [ObjC](ObjC.html)\
\

iphone device type string {.heading-level2}
-------------------------

from:[http://www.devdiv.com/forum.php?mod=viewthread&tid=122890&page=1\#pid710813](http://www.devdiv.com/forum.php?mod=viewthread&tid=122890&page=1#pid710813)\
 \#import \<sys/utsname.h\>\
 /\*\
 \* 获取版本型号\
 \* "i386" simulator\
 \* "iPod1,1" iPod Touch\
 \* "iPhone1,1" iPhone\
 \* "iPhone1,2" iPhone 3G\
 \* "iPhone2,1" iPhone 3GS\
 \* "iPad1,1" iPad\
 \* "iPhone3,1" iPhone 4 **/ + (NSString**)deviceString { struct utsname

systemInfo; uname(&systemInfo); NSString \*deviceString = [NSString\
 stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];\

} \
 \
 \

[http://stackoverflow.com/questions/12559043/whats-the-value-of-hw-machine-for-iphone5](http://stackoverflow.com/questions/12559043/whats-the-value-of-hw-machine-for-iphone5)\
 \

(NSString\*)machineType {.heading-level1}
=======================

{

static NSString \*platform = nil;\
 if (nil == platform)\
 {

}\
 \
 // For iphone it's a litter strange, @"iPhone3,x" is for iPhone4,
@"iPhone4,1" is for iPhone4S.\
 if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 1G";\
 if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";\
 if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";\
 if ([platform hasPrefix:@"iPhone3"]) return @"iPhone 4"; //
@"iPhone3,1" for @"iPhone 4", @"iPhone3,3" for @"Verizon iPhone 4".\
 if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";\
 if ([platform hasPrefix:@"iPhone5"] || [platform hasPrefix:@"iPod5"])
return @"iPhone 5"; //iPhone 5 GSM - iPhone5,1 iPhone 5 CDMA - iPhone5,2
iPod 5 - iPod5,1\
 \
 return platform;

}\

