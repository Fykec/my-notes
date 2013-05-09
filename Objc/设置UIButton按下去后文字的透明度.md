parent nodes: [ObjC](ObjC.html)\
\

设置UI Button按下去后文字的透明度 {.heading-level2}
---------------------------------

[\_backButton setTitle:NSLocalizedString(@"Back...", @"")
forState:UIControlStateNormal];\
 [\_backButton setTitleColor:[CommonFunctions colorFromInt:0xffffffff]
forState:UIControlStateNormal];\
 [\_backButton setTitleColor:[CommonFunctions colorFromInt:0x4cffffff]
forState:UIControlStateHighlighted]\
 \
 normal 0xffffffff\
 pressed 0x4cffffff\
 \
 alpha = 0x4c/0xff = 0.3
