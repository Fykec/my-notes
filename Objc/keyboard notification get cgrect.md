parent nodes: [ObjC](ObjC.html)\
\

keyboard notification get cgrect {.heading-level2}
--------------------------------

\
 [[NSNotificationCenter defaultCenter] addObserver:self
selector:@selector(onKeyboardDidChangeFrame:)
name:UIKeyboardDidChangeFrameNotification object:nil];\
 \
 - (void)onKeyboardDidChangeFrame:(NSNotification **)notif\
 {\
 \
 NSValue**keyboardEndFrameValue = [notif.userInfo
objectForKey:@"UIKeyboardFrameEndUserInfoKey"];

}\
 \
 \
 //landcape is special\
 - (CGSize)fpContentSizeWithKeyboardFrame:(CGRect)keyboardFrame\
 {

CGRect mainScreenBounds = [UIScreen mainScreen].bounds;\
 \
 if ([[UIApplication sharedApplication] statusBarOrientation] ==
UIDeviceOrientationLandscapeRight)\
 {

CGFloat keyboardLeftSpaceLength = keyboardFrame.origin.x; //Here is
special in landscape mode\
 if (keyboardLeftSpaceLength \< mainScreenBounds.size.width &&
!CGRectEqualToRect(keyboardFrame, CGRectZero))\
 {

}

}\
 else if ([[UIApplication sharedApplication] statusBarOrientation] ==
UIDeviceOrientationLandscapeLeft)\
 {

CGFloat keyboardLeftSpaceLength = mainScreenBounds.size.width -
keyboardFrame.size.width; //Here is special in landscape mode\
 if (keyboardFrame.origin.x \>= 0 && !CGRectEqualToRect(keyboardFrame,
CGRectZero))\
 {

}

}\
 \
 \
 return CGSizeMake(SHARE\_PANEL\_WIDTH, SHARE\_PANEL\_HEIGHT);

}\
 \
 assume have two or more window in an app, only key window will receive
keyboard notification in iOS 6, so need noitce
