parent nodes: [ObjC](ObjC.html)\
\

UI Scroll View卡 {.heading-level2}
----------------

//ScrollView 里面有一张长图片，不停的设置 ScrollView的frame会一直layout
scrollView，这样会很卡\
 \
 Important: You should not embed [UIWebView](UIWebView.html) or
UITableView objects in UIScrollView objects. If you do so, unexpected
behavior can result because touch events for the two objects can be
mixed up and wrongly handled.\
 \
 You can embed UIScrollView in UIScrollView
