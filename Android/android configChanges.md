parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

android config Changes {.heading-level2}
----------------------

这是hipak那边测试反馈回来的一个问题，说来惭愧，一直没注意到这个问题的存在。以为Power键就是onPause处理就完了，结果不是。\

这里边google的设计或许也有点问题，在竖屏情况下也许是一样处理的，不过当你的app是横屏，那就要注意了。\

每次Power键的时候，app是会强制回到竖屏状态的，并且会重新调用Activity的onCreate()，当然很多时候这不是我们想要的。所以就需要用到android:configChanges了，在配置文件里设置android:configChanges="keyboardHidden|orientation"，这样在屏幕方向改变的时候就不会重新调用Activity的onCreate()，而是调用onConfigurationChanged()，然后在Activity里重载下\
 \
 @Override\
 public void onConfigurationChanged(Configuration newConfig){

super.onConfigurationChanged(newConfig);\
 if(newConfig.orientation==Configuration.ORIENTATION\_LANDSCAPE){

}else{

}

}\

一般就这么处理下就可以了，要命的是用到了SurfaceView，而SurfaceView和Thread的生命周期是不一样的，唉，这里要说一下Google提供的sample了，里边有bug!!\
 由于每次Power键的时候会调用SurfaceView的surfaceDestroyed(SurfaceHolder
holder)，但是回到app的时候又没有执行surfaceCreated(SurfaceHolder
holder)，于是就咯屁了～～\
 目前想到一个能解决的方案是在onConfigurationChanged(Configuration
newConfig)里手动处理，surfaceDestroyed(SurfaceHolder
holder)+urfaceCreated(SurfaceHolder holder)+pause()处理。。。\
 唉，希望可以找到一个比较好的解决方案吧。。\
 \

