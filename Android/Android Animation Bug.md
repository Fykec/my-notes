parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Android Animation Bug {.heading-level2}
---------------------

比如在1.6的G2上AnimationListener
不会正常停止，只调用了onAnimationStart()没有正常调用onAnimationEnd(),\

所以要正常停止可以把onAnimationEnd()要实现的功能放在ImageView的onAnimationEnd()的方法中，所以可以实现自己的ImageView的子类，重写onAnimationEnd()方法。\
 \

[http://stackoverflow.com/questions/4750939/android-animation-is-not-finished-in-onanimationend](http://stackoverflow.com/questions/4750939/android-animation-is-not-finished-in-onanimationend)\
 \
 \
 Here is the actual bug related to this issue
[http://code.google.com/p/android-misc-widgets/issues/detail?id=8](http://code.google.com/p/android-misc-widgets/issues/detail?id=8)\
 \
 This basically states that the onAnimationEnd method doesn't really
work well when an AnimationListener is attached to an Animation\
 \
 The workaround is to listen for the animation events in the view to
which you were applying the animation to For example if initially you
were attaching the animation listener to the animation like this\

mAnimation.setAnimationListener(new AnimationListener() {

@Override\
 public void onAnimationEnd(Animation arg0) {

}\

and then applying to the animation to a [ImageView](ImageView.html) like
this\

To work around this issue, you must now create a custom
[ImageView](ImageView.html)\

and then override the onAnimationEnd method of the View class and
provide all the functionality there\

@Override\
 protected void onAnimationEnd() {

}\

This is the proper workaround for this issue, provide the functionality
in the over-riden View -\> onAnimationEnd method as opposed to the
onAnimationEnd method of the AnimationListener attached to the
Animation.\
 \
 This works properly and there is no longer any flicker towards the end
of the animation. Hope this helps.\

