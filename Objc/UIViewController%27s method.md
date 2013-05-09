parent nodes: [ObjC](ObjC.html)\
\

UI View Controller's method {.heading-level2}
---------------------------

-(void)viewDidLoad \
 here view.frams is rect zero\
 -(void)viewWillAppear\
 here view.frame is rect zero\
 -(void)viewDidApppear\
 here view.frame is non rect zero\
 \
 navigtaion bar titleView and title\
 \
 【iPhone】【7.0】【Share】【Box】All
files画面和Box画面切换时,切换的动画会有瞬间重叠显示\
 \
 两个viewcontroller 两个用navigationBar titieVIew
或title，只要是第二个用了titleView，无论第一个是用title还是titleView，都会有这种问题
