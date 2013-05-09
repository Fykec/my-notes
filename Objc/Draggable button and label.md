parent nodes: [ObjC](ObjC.html)\
\

Draggable button and label {.heading-level2}
--------------------------

[http://www.cocoanetics.com/2010/11/draggable-buttons-labels/](http://www.cocoanetics.com/2010/11/draggable-buttons-labels/)\
 \
 Cocoanetics OUR DNA IS WRITTEN IN OBJECTIVE-C\
 Youtube\
 Twitter\
 Email\
 RSS\
 \
 Jump\
 HOME\
 BLOG\
 PODCAST\
 PARTS STORE\
 OUR APPS\
 CLIENTS\
 ADVERTISE\
 Draggable Buttons and Labels\
 \
 Nov 25, 2010\
 luckysmiles asks:\
 \
 Pls anyone help me…how to move controls(like button,label.. ) from one
place to another using touch events in iphone..\
 There are 3 possibilities nowadays on how to enable items – that is
UIViews and UIControls – to be draggable.\
 \
 override touchesMoved\
 add a target/selector for dragging control events\
 add a pan gesture recognizer\
 All those are variations on essentially the same thing: the iOS
delivers touches to your app and you have more or less intelligent
plumbing to calculate a moving vector. Then you apply this delta to
either the frame of the thing to be moved or, more intelligently change
the item’s center property.\
 \
 When I started building a sample I wanted to create a UIButton subclass
with the added draggability and have this button be instantiated from a
XIB. Now it turns out that you can only create custom buttons like this,
not rounded rect buttons like you usually do. The reason for this being
that the regular initWithFrame or initWithCoder for a subclassed
UIButton would need to instead create a UIRoundedRectButton (private
Apple class) to look like that.\
 \
 Because of this I’m abandoning the fancy-pantsy extra class and instead
we’ll just take a plain empty view controller and do it all in code.
Here we add a centered button and use the version of the target/action
method that also gets the UIEvent so that we can calculate the
movement.\
 \
 - (void)viewDidLoad \
 {

// create a new button\
 UIButton **button = [UIButton buttonWithType:UIButtonTypeRoundedRect];\
 [button setTitle:@"Drag me!" forState:UIControlStateNormal];\
 \
 // add drag listener\
 [button addTarget:self action:@selector(wasDragged:withEvent:)**

// center and size\
 button.frame = CGRectMake((self.view.bounds.size.width - 100)/2.0,

// add it, centered\
 [self.view addSubview:button];\
 }\
 \
 - (void)wasDragged:(UIButton )button withEvent:(UIEvent **)event\
 {\
 // get the touch\
 UITouch**touch = [[event touchesForView:button] anyObject];\
 \
 // get delta\
 CGPoint previousLocation = [touch previousLocationInView:button];\
 CGPoint location = [touch locationInView:button];\
 CGFloat delta\_x = location.x - previousLocation.x;\
 CGFloat delta\_y = location.y - previousLocation.y;\
 \
 // move button\
 button.center = CGPointMake(button.center.x + delta\_x,

}\
 Now this does not have anything to check for certain bounds. The center
coordinate of any view is always stated in the coordinate system of the
view’s superview. So you might want to make sure that you limit the
range of values for x and y so that you cannot move the button outside
of the useful area. Note that by default views don’t clip, so if the
superview does not cover the entire screen you could still move outside
of it. With clipping enabled the button would be clipped off when moved
outside of the frame of its superview.\
 \
 This case lends itself to using the target/action mechanism because
it’s available for any subclass of UIControl. As long as you stick with
regular controls this is a great and backwards compatible method of
achieving draggability. UILabel is derived from UIView and therefore
does not have the addTarget:Action:forControlEvents method. So here we
need to do something else.\
 \
 We could ever step backward in history and override the touch methods,
or step forward and use UIGestureRecognizers (available on devices with
iOS 3.2 and higher). We live in the future and way more than half of the
devices out there have an iOS \> 4.0. So I’ll show you how to move a
UILabel by means of a gesture recognizer.\
 \
 The gesture we want to use is called a “pan”. Now that you know
target/action you’ll immediately recognize a very similar mechanism
here, but instead of a pointer to the view and optional UIEvent actually
a pointer to the gesture recognizer is delivered.\
 \
 - (void)viewDidLoad \
 {

// create a label\
 UILabel **label = [[[UILabel alloc] initWithFrame:CGRectMake(10, 10,
100, 50)]**

label.text = @"Drag me!";\
 \
 // enable touch delivery\
 label.userInteractionEnabled = YES;\
 \
 UIPanGestureRecognizer gesture = [[[UIPanGestureRecognizer alloc]

[label addGestureRecognizer:gesture];\
 \
 // add it\
 [self.view addSubview:label];

}\
 \
 - (void)labelDragged:(UIPanGestureRecognizer \*)gesture\
 {

UILabel **label = (UILabel**)gesture.view;\
 CGPoint translation = [gesture translationInView:label];\
 \
 // move label\
 label.center = CGPointMake(label.center.x + translation.x,

// reset translation\
 [gesture setTranslation:CGPointZero inView:label];

}\
 We need to enable touch delivery via userInteractionEnabled because
otherwise UILabels are generally deaf to touches. It’s very practical of
the gesture recognizer specialized on pans to be providing the delta
movement in form of a translation. Those deltas are cumulative and so at
the end of our drag handler we need to set the translation back to
zero.\
 \
 \
 \
 This would need a bit more code to be usable by users. Maybe a wiggling
animation like we have it on the springboard to show that something is
movable? Because how would a user suspect that he could drag something?
But this should be sufficient to get you started on making your app more
interactive.\
 \
 Sharing:\
 More\
 \
 Categories: Recipes\
 ← We Moved!glif duels two other iPhone 4 Tripod Mounts →\
 \
 7 Replies\
 5 Comments\
 0 Tweets\
 0 Facebook\
 2 Pingbacks\
 last reply was 3 months ago\
 Moving the controls... - iPhone Dev SDK Forum\
 November 25, 2010\
 [...] i will approach u.. Thank u.. I elaborated on 2 or the 3
mentioned techniques in this article: Draggable Buttons and Labels @
Cocoanetics *\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_* regards Oliver Drobnik
Cocoanetics – Our DNA is programmed in Objective-C. [...]\
 Draggable Buttons and Labels | SCORITZ\
 November 25, 2010\
 [...] the original post here: Draggable Buttons and Labels Bookmark on
Delicious Digg this post Recommend on Facebook share via Reddit Share
with Stumblers [...]\
 \
 Deep\
 March 23, 2011\
 Thanx a LOT… I desperately needed it…..working just fine\
 \
 Seb\
 August 31, 2011\
 Nice one, thx!!!\
 \
 rakesh\
 September 19, 2011\
 Thanks Alot… It worked for me…\
 \
 Dave\
 10 months ago\
 Fantastic.\
 Thanks so much. Just what I needed and it works perfectly.\
 \
 Anonymous\
 3 months ago\
 its was really helpful… thanks a lot… \
 Log In\
 Register\
 © 2013 Drobnik KG\
 License:\
 \
 \

