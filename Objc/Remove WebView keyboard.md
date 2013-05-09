parent nodes: [ObjC](ObjC.html)\
\

Remove Web View keyboard {.heading-level2}
------------------------

/\*

-   -   

\*/

{

NSArray **windows = [[UIApplication sharedApplication] windows];\
 \
 for (UIWindow**keyboardWindow in windows)\
 {

NSArray **windowViews = [keyboardWindow subviews];\
 for (UIView**keyboard in windowViews)\
 {

DebugLog(@"nstartn%@ n%@ endn",[windowViews description] ,[keyboard
description]);\
 \
 // iOS 4 sticks the UIKeyboard inside a UIPeripheralHostView.\
 if ([[keyboard description] hasPrefix:@"\<UIPeripheralHostView"]) \
 {

// [keyboard listAll:[keyboard superclass]];\
 // [keyboard orderOutWithAnimation:YES];

}
