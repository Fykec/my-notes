parent nodes: [ObjC](ObjC.html)\
\

获取device locale {.heading-level2}
-----------------

\

(NSString \*)deviceLocale {.heading-level1}
=========================

{

NSLocale **currentLocale = [NSLocale currentLocale];\
 NSString**currentLocaleString = [currentLocale
localeIdentifier];//result like en\_US\
 //change string to enUS\
 if(nil != currentLocaleString)\
 {

if (-1 != [currentLocaleString rangeOfString:@"\_"].location) \
 {

}

}\
 return @"enUS";//default return enUS\

}
