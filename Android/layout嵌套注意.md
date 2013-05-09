parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

layout嵌套注意 {.heading-level2}
--------------

\<?xml version="1.0" encoding="utf-8"?\>\
 \<RelativeLayout

xmlns:android="[http://schemas.android.com/apk/res/android](http://schemas.android.com/apk/res/android)"\
 android:layout\_width="fill\_parent"\
 android:layout\_height="fill\_parent"\>

\<com.beta.ads.view.AdsViewContainer
xmlns:ads="[http://schemas.android.com/apk/res/com.opencourse.learn](http://schemas.android.com/apk/res/com.opencourse.learn)"

\
 \<ListView\

xmlns:android="[http://schemas.android.com/apk/res/android](http://schemas.android.com/apk/res/android)"\
 android:id="@+id/list"\
 android:layout\_width="fill\_parent"\
 android:layout\_height="fill\_parent"\
 android:cacheColorHint="@android:color/transparent"\
 android:divider="@drawable/list\_divider"\>\

\
 \
 \

ListView嵌套在RelativeLayout中时为了防止ListView占满全屏，显示不了其他控件比如上面的adsview，
要在ListView外面嵌套一个LinearLayout
