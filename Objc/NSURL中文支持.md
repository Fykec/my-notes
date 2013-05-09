parent nodes: [ObjC](ObjC.html)\
\

NSURL中文支持 {.heading-level2}
-------------

Should only endcode chinese part of url\
 \

(NSString **)encodeURL:(NSString**)string {.heading-level1}
=========================================

{

NSString **result =
(NSString**)CFURLCreateStringByAddingPercentEscapes(NULL,

(CFStringRef)string, \
 (CFStringRef)@"!\*'();:@&=+\$,/?%\#[]",

kCFStringEncodingUTF8);

return [result autorelease];

}\
 \
 urlString = [NSURL encodeURL:urlString];\
 可以解决特殊字符问题，比如竖线 “|”，但是不能解决中文的url比如
www.百度.com
