parent nodes: [ObjC](ObjC.html)\
\

Convert charset name to NS String Encoding {.heading-level2}
------------------------------------------

[http://stackoverflow.com/questions/2891327/convert-charset-name-to-nsstringencoding](http://stackoverflow.com/questions/2891327/convert-charset-name-to-nsstringencoding)\
 \
 You have to go through CoreFoundation.\
 \
 CFStringConvertIANACharSetNameToEncoding\
 CFStringConvertEncodingToNSStringEncoding
