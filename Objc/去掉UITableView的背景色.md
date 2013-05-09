parent nodes: [ObjC](ObjC.html)\
\

去掉UI Table View的背景色 {.heading-level2}
-------------------------

​(1) for iphone\
 \
 self.tableView.backgroundColor = [UIColor clearColor];\
 \
 \
 (2) for iPad\
 \
 self.tableView.backgroundColor = [UIColor clearColor];\
 self.tableView.backgroundView = nil;\
 \
 or\
 \
 self.tableView.backgroundColor = [UIColor clearColor];\
 self.tableView.backgroundView = [[[UIView alloc] init] autorelease];\
 \

[http://stackoverflow.com/questions/2688007/uitableview-backgroundcolor-always-gray-on-ipad](http://stackoverflow.com/questions/2688007/uitableview-backgroundcolor-always-gray-on-ipad)
