parent nodes: [CGAffineTransform](CGAffineTransform.html) |
[ObjC](ObjC.html)\
\

CG Affine Transform {.heading-level2}
-------------------

可以实现缩放，旋转和平移\
 \
 使用CGAffineTransform实现对控件的旋转\
 2010-12-21 20:33\
 今天在CC上看到这个功能，感觉挺好玩的，记下了，以便后用！\
 [CGAffineTransform](CGAffineTransform.html) rotation =
CGAffineTransformMakeRotation(M\_PI\_2);\
 [xxx setTransform:rotation];\
 呵呵就这么简单的两行代码就可以实现了！\
 顺便记录一些常量，以后用的着！\
 \#define M\_E 2.71828182845904523536028747135266250 e\
 \#define M\_LOG2E 1.44269504088896340735992468100189214 log 2e\
 \#define M\_LOG10E 0.434294481903251827651128918916605082 log 10e\
 \#define M\_LN2 0.693147180559945309417232121458176568 log e2\
 \#define M\_LN10 2.30258509299404568401799145468436421 log e10\
 \#define M\_PI 3.14159265358979323846264338327950288 pi\
 \#define M\_PI\_2 1.57079632679489661923132169163975144 pi/2\
 \#define M\_PI\_4 0.785398163397448309615660845819875721 pi/4\
 \#define M\_1\_PI 0.318309886183790671537767526745028724 1/pi\
 \#define M\_2\_PI 0.636619772367581343075535053490057448 2/pi\
 \#define M\_2\_SQRTPI 1.12837916709551257389615890312154517 2/sqrt(pi)\
 \#define M\_SQRT2 1.41421356237309504880168872420969808 sqrt(2)\
 \#define M\_SQRT1\_2 0.707106781186547524400844362104849039 1/sqrt(2)
