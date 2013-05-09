parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Animation bug {.heading-level2}
-------------

android animation is not finished in onAnimationEnd\
 \
 2 down vote accepted\
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

