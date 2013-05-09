parent nodes: [ObjC](ObjC.html)\
\

Obj C学习笔记 {.heading-level2}
-------------

\
 1. +号为类方法\
 2. -号为对象方法\
 3. 初始化数组时，nil表示数组结束\
 NSArray \*array;\
 array = [NSArray arrayWithObjects: @"one", @"two", @"thress", nil];\
 4. nil也表示，NSDictionary结束,要在数组和字典中表示null，用NSNull\
 5. NSUInteger NSU是什么的，typedef unsigned int NSUInteger; \
 6. SEL是什么？\# Selector

​7. Exception setValue:forUndefinedKey:]: this class is not key value
coding-complaint for \
 the key \

​8. 打印数字NSUInteger用％d,不要用％@ NSLog(@"Action type: %d",
[kGestureActionDictionary count]);\
 9. 只通过 @property来声明，不在interface的括号里声明，外界无法访问\

10。ios和android一样，listiew的item也会重用，所以，如果track点击事件，不要track换图片，而要track点击事件，这样才不会一次点击引发多次track\
 11. @property (nonatomic) NSInteger index; NSInger can not use retain!\
 12. objc和 c++一样，不能循环引用，要实现互相引用，用@class\
 13. Set keyboard return key UITextField \_searchTextField.returnKeyType
= UIReturnKeySearch;//Display in keyboard\
 14. 调试控件之间的响应是否被挡住，可以设置背景色，来区别
