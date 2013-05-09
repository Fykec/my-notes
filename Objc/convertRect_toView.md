parent nodes: [ObjC](ObjC.html)\
\

convert Rect\_to View {.heading-level2}
---------------------

method convertRect:toView\
 \
 if you want convert aView's frame to bView's frame\
 assume aView's superview is aSuperView\
 bView's superView is bSuperView\
 \
 must call like this \
 CGRect retRect =[aSuperView convertRect:aView.frame
toView:bSuperView];\
 \
 bView.frame = retRect;
