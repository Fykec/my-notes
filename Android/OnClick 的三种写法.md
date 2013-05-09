parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

On Click 的四种写法 {.heading-level2}
-------------------

布局文件\
 \<?xml version="1.0" encoding="utf-8"?\>\
 \<LinearLayout
xmlns:android="[http://schemas.android.com/apk/res/android](http://schemas.android.com/apk/res/android)"

\<TextView

android:layout\_width="fill\_parent" \
 android:layout\_height="wrap\_content" \
 android:text="@string/hello"\
 /\>\
 \<Button

\
 \<Button

\
 \<Button

\
 \
 \
 package com.foster;\
 \
 import android.app.Activity;\
 import android.os.Bundle;\
 import android.view.View;\
 import android.view.View.OnClickListener;\
 import android.widget.Button;\
 import android.widget.Toast;\
 \
 public class Demo extends Activity {

/**** Called when the activity is first created. **/\
 @Override\
 public void onCreate(Bundle savedInstanceState) {**

@Override\
 public void onClick(View v) {\
 Toast.makeText(Demo.this, "Button 1 response!",
Toast.LENGTH\_SHORT).show();\
 \
 }\
 });\

}\
 \
 Button.OnClickListener listener = new Button.OnClickListener() {//
创建监听对象\
 \
 @Override\
 public void onClick(View v) {\
 \
 Toast.makeText(Demo.this, "Button 2 response!", Toast.LENGTH\_SHORT)

}\
 \
 };\
 \
 /\*

-   -   -   -   

public void onBtn3Click(View view) {

.show();

}\
 \
 第四种写法是 让activity实现View.OnClickListener
接口然后button在button.setOnClickListener(this);\

