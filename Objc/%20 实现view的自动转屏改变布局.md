parent nodes: \
\

实现view的自动转屏改变布局 {.heading-level2}
--------------------------

​1. 设置父view的 autoreizeSubviews为YES\
 2. 设置父view的autoresizemask为\
 3. 重写父view的layoutsubviews方法，在里面改变布局\

并且在layoutesubbiews里要调用super的layoutesubviews把消息传到下层的views\
 \
 根据横竖屏，自动设置大小\
 \
 -(CGRect)rootViewOrentationSize\
 {

float newX = 0;\
 float newY = 0;\
 float newWidth = 0;\
 float newHeight = 0;\
 if (UIInterfaceOrientationIsLandscape([UIApplication
sharedApplication].statusBarOrientation))\
 {

}\
 else\
 {

}\
 return CGRectMake(newX, newY, newWidth, newHeight);

}\

