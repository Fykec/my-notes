parent nodes: [ObjC](ObjC.html)\
\

按照文字多少确定UI Label大小 {.heading-level2}
----------------------------

UILable实现按照文字多少定义大小\
 \

UILable显示文字，大多数情况下文字是动态的，所以UILable的大小需要自适用,下面是实现的具体代码：\
 \
 myLable=[[UILabel alloc] initWithFrame:CGRectMake(0, 23, 175, 33)];

UIFont \*font = [UIFont fontWithName:@"Helvetica" size:10.0];


