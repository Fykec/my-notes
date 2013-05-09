parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

sing Line\_滚动 {.heading-level2}
---------------

要滚动必须，就要获得焦点，要自动滚动就要始终获得焦点，要重写获得焦点的方法\

/************************************************************************************************************************************************************\*

package com.opencourse.view;\
 \
 import android.content.Context;\
 import android.text.TextUtils.TruncateAt;\
 import android.util.AttributeSet;\
 import android.widget.TextView;\
 \
 /****

-   

public class AlwaysMarqueeTextView extends TextView{\
 \

public AlwaysMarqueeTextView(final Context context) {

}\
 \
 public AlwaysMarqueeTextView(final Context context, final AttributeSet
attrs) {

}\
 \
 public AlwaysMarqueeTextView(final Context context, final AttributeSet
attrs, final int defStyle) {

}\
 \
 private void init(){

}\
 \
 @Override\
 public boolean isFocused() {

}

}\

