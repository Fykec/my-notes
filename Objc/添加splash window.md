parent nodes: [ObjC](ObjC.html)\
\

添加splash window {.heading-level2}
-----------------

iPhone SDK Tutorial for Creating a Splash Screen\
 \
 iPhone Tutorial for Creating a Splash Screen\
 Introduction:\
 \
 Some people asked me about creating a splash screen in iPhone. So today
I am going to write a simple tutorial on creating splash view for your
application. I will write another post on good looking splash page as
well. Its really a small thing but have a really good impact on your
users.\
 \
 So lets use this image as your splash screen (This is Skype application
splash screen)\
 \
 \
 \
 Step 1:Create a new Xcode project and name it Splash. Open the
SplashViewController.xib file and change the background colour to white.
Run the application and you will see a black screen appear before it
shows you white screen.\
 \
 Step 2:Drag the above image in to your resources file. Rename the file
to Default.png（Must png）. Run your application, you will see that this
image will be a splash screen for your project (Its so easy !). So the
concept is that sdk provide you a way to display user something before
your application loads fully into memory. So default.png file basically
shows user that something is coming and give iPhone time to load
resources required for the application into memory. You can add any
image on your application and name it Default.png and it will become
your starting (splash/default) screen.\
 \
 Now you want that your splash screen will be displayed around 2-3
seconds before it display the main screen to user or you want to load
something from server. So to do that, I am going to use model view which
will be shown to user and hide after 3 seconds. You can customized it if
you want to hide it from code either then using fixed time.\
 \
 Step 3:In SplashAppDelegate.m file write this line at the end of
applicationDidFinishLaunching method.\
 \
 [viewController showSplash];\
 \
 Step 4:In your SplashViewController.h file write these two methods
definitions and also add a IBOutlet variable.\
 \
 IBOutlet UIView **modelView;\
 \
 - (void)showSplash;**

Step 5:Write the following code at the end of SplashController.m file\
 \
 -(void)showSplash

UIViewController modalViewController = [[UIViewController alloc] init];\
 \
 modalViewController.view = modelView;\
 \
 [self presentModalViewController:modalViewController animated:NO];\
 \
 [self performSelector:@selector(hideSplash) withObject:nil
afterDelay:2.0];\
 \
 }\
 \
 //hide splash screen\
 \
 - (void)hideSplash{\
 \
 [[self modalViewController] dismissModalViewControllerAnimated:YES];\
 \
 }\
 \
 Step 6:Now you have to map modelView inside Interface builder. (Watch
video to better understand this) Drag a view to your SplashView\
 \
 Step 7:Add the [UIImageView](UIImageView.html) to new view and change
the image name to Default.png. Map this to modelView in
SplashController.\
 Splash Screen code\
 \
 You can grab this code from here.\
 \
 original article:
[http://adeem.me/blog/2009/06/22/creating-splash-screen-tutorial-for-iphone/](http://adeem.me/blog/2009/06/22/creating-splash-screen-tutorial-for-iphone/)
