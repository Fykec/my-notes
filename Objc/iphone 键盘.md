parent nodes: [ObjC](ObjC.html)\
\

iphone 键盘 {.heading-level2}
-----------

响应事件的设置\
 1. set UITextField return type and delegate

​2. implement delegate\
 \
 \#pragma mark - UITextField Delegate\
 - (BOOL)textFieldShouldReturn:(UITextField \*)textField // called when
'return' key pressed. return NO to ignore.\
 {

}
