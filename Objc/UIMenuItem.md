parent nodes: [ObjC](ObjC.html)\
\

UI Menu Item {.heading-level2}
------------

[UIMenuItem alloc] initWithTitle:@"Title"
action:@selector(menuItemAction:)];\
 \
 because here not set (and cannot set the target), so it will find
target on the ui responder chain\
 \
 which is part of UIResponder. If the object returns NO, the system
walks up the UIResponder chain until it finds an object that returns YES
or nextResponder returns nil.\
 A typical resonder chain looks like this: UIView -\> UIViewController
-\> UINavigationController -\> UIApplication -\> AppDelegate.\
 \

[http://petersteinberger.com/blog/2012/hacking-block-support-into-uimenuitem/](http://petersteinberger.com/blog/2012/hacking-block-support-into-uimenuitem/)\
 \

[http://stackoverflow.com/questions/7642181/uimenucontroller-and-the-responder-chain-whats-going-on](http://stackoverflow.com/questions/7642181/uimenucontroller-and-the-responder-chain-whats-going-on)
