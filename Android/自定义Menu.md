parent nodes: [Android Menu](Android%20Menu.html)\
\

自定义Menu {.heading-level2}
----------

首先，写出自己menu的layout：\
 \<?xml version="1.0" encoding="UTF-8"?\>\
 \<LinearLayout
xmlns:android="[http://schemas.android.com/apk/res/android](http://schemas.android.com/apk/res/android)"

\>

\<Button android:id="@+id/menu\_add"

\<Button android:id="@+id/menu\_synchronize"

\<Button android:id="@+id/menu\_setting"

\<Button android:id="@+id/menu\_exit"

\

其中android：drawableTop的值是自己定义的一个selector，这个就自己看着办了，很简单。\
 然后要定义一个类，继承自LinearLayout：\
 public class MyLinearLayout extends LinearLayout {

private Context context;\
 private Button add;\
 private Button setting;\
 private Button synchronize;\
 private Button exit;\
 \
 public MyLinearLayout(Context context) {

}\
 \
 public MyLinearLayout(Context context, AttributeSet attrs) {

}\
 \
 private void setView() {

你也发现了，是和xml文件定义一致的，即用这个类来解析和控制menu，以前menu中的每个Item就是现在的一个Button，可以在Button上添加Listener完成相应的功能。\
 接下里就是要把menu加入main.xml中：\
 \<com.test.MyLinearLayout

将上述代码加入main.xml中，要注意的是一定要保证你的main.xml最外层是RelativeLayout，这样可以控制你的menu在屏幕中的位置如：android:layout\_alignParentBottom="true"/且不会挤压其他控件。\

接着就是要控制menu怎么显示和隐藏了，在主Activity里，定义一个LinearLayout实例linearLayout
= (LinearLayout)
findViewById(R.id.linearlayout)，且linearLayout.setVisibility(android.view.View.GONE)，增加一个方法:\
 public static void setMenuEvent(LinearLayout layout) {

if(layout.getVisibility() == android.view.View.GONE) {

}else{

}

重写一个方法：\
 @Override

public boolean onKeyUp(int keyCode, KeyEvent event) {

// LinearLayout menu = (LinearLayout)findViewById(R.id.menu);\
 // LinearLayout l = new LinearLayout(this);\
 // l.setVisibility(android.view.View.GONE);

Ok了，现在build project就可以运行了。
