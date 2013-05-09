parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

让 Scroll View触摸没反应 {.heading-level2}
------------------------

重写onTouchEvent（）方法，始终返回true或false，不做父类里面的事就可以了，\
 \
 import android.content.Context;\
 import android.util.AttributeSet;\
 import android.view.MotionEvent;\
 import android.widget.HorizontalScrollView;\
 \
 public class NoTouchHorizontalScrollView extends HorizontalScrollView
{\

public NoTouchHorizontalScrollView(Context context, AttributeSet attrs,

}\
 \
 public NoTouchHorizontalScrollView(Context context, AttributeSet attrs)
{

}\
 \
 public NoTouchHorizontalScrollView(Context context) {

}\
 \
 @Override\
 public boolean onTouchEvent(MotionEvent ev) {

}

}
