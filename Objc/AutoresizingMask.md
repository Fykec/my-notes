parent nodes: [ObjC](ObjC.html)\
\

Autoresizing Mask {.heading-level2}
-----------------

设置如下 autoresizingmask\
 如果一个view在后台的controller里面那么他就不会被自动布局\
 \_contentView.autoresizingMask =
UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;\
 \

那么它的superview frame
B改变时他就会被改变，如果A是一个UIScrollView，那么它的contentOffset就会被重置，这个时候就要把scrollview滚到合适的offset
