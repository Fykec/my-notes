parent nodes: [ObjC](ObjC.html)\
\

正确设置隐藏状态栏时view布局 {.heading-level2}
----------------------------

//隐藏\
 \
 	[[UIApplicationsharedApplication]
	setStatusBarHidden:YESwithAnimation:UIStatusBarAnimationFade]; \
 \
 	[self.viewsetFrame: [[UIScreenmainScreen] bounds]];\
 \
 //显示\
 \
 	[[UIApplication sharedApplication] setStatusBarHidden:NO
	withAnimation:UIStatusBarAnimationFade];\
 \
 	[self.view setFrame: [[UIScreen mainScreen] applicationFrame]];\
 \

[http://www.cnblogs.com/ThankForYou/archive/2012/08/07/2626810.html](http://www.cnblogs.com/ThankForYou/archive/2012/08/07/2626810.html)\

