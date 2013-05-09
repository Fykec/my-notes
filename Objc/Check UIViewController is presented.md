parent nodes: [ObjC](ObjC.html)\
\

Check UI View Controller is presented {.heading-level2}
-------------------------------------

-(BOOL)isModal {\

BOOL isModal = ((self.parentViewController &&
self.parentViewController.modalViewController == self) ||

//iOS 5+\
 if (!isModal && [self
respondsToSelector:@selector(presentingViewController)]) {\

isModal = ((self.presentingViewController &&
self.presentingViewController.modalViewController == self) ||

}\
 \
 return isModal; \

}\
 \

[http://stackoverflow.com/questions/2798653/is-it-possible-to-determine-whether-viewcontroller-is-presented-as-modal/6349300\#6349300](http://stackoverflow.com/questions/2798653/is-it-possible-to-determine-whether-viewcontroller-is-presented-as-modal/6349300#6349300)
