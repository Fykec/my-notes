parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

List View\_item点击没反应 {.heading-level2}
-------------------------

原因1. item的子控件（比如 button）获取了焦点，让父控件获取不到焦点\
 解决方法如下：\
 设置button的focusable属性为false，但是让它也可以点击

\<?xml version="1.0" encoding="utf-8"?\>\
 \<LinearLayout

xmlns:android="[http://schemas.android.com/apk/res/android](http://schemas.android.com/apk/res/android)"\
 android:layout\_width="fill\_parent"\
 android:layout\_height="@dimen/list\_item\_height"\
 android:background="@drawable/list\_item\_selector"\
 android:orientation="horizontal"\
 android:gravity="center\_vertical"\>\
 \<TextView

\<TextView

\<Button

\

