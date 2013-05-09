parent nodes: [ObjC](ObjC.html)\
\
 \
 // color format 0xFFFFFFFF ARGB\

(UIColor \*)colorFromInt:(long)intColor {.heading-level1}
=======================================

{

}\
 \

(long)intFromColor:(UIColor \*)color {.heading-level1}
====================================

{

CGFloat red = 0.f;\
 CGFloat green = 0.f;\
 CGFloat blue = 0.f;\
 CGFloat alpha = 0.f;\
 \
 if (IsAtLeastiOSVersion(@"5.0"))\
 {

//[http://stackoverflow.com/questions/10699385/uidevicergbcolor-getredgreenbluealpha-unrecognized-selector-not-due-to-mem](http://stackoverflow.com/questions/10699385/uidevicergbcolor-getredgreenbluealpha-unrecognized-selector-not-due-to-mem)\
 \
 if ([color getRed:&red green:&green blue:&blue alpha:&alpha])\
 {

}

}\
 else\
 {

//[http://stackoverflow.com/questions/816828/extracting-rgb-from-uicolor](http://stackoverflow.com/questions/816828/extracting-rgb-from-uicolor)\
 int numComponents = CGColorGetNumberOfComponents(color.CGColor);\
 \
 if (numComponents == 4)\
 {

}

}\
 return 0;

}
