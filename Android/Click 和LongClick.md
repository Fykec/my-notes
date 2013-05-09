parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Click 和Long Click {.heading-level2}
------------------

如下longClick有返回值\
 viewHolder.linearLayout1

.setOnLongClickListener(new OnLongClickListener() {\

@Override\
 public boolean onLongClick(View v) {\

}

});

返回true表示是longclick，返回false，就是别的，也就是说如果同时监听了click事件，系统会判定这是一个click事件，\
 \
 因此当返回false是，longclick会先后触发longclick和click的响应事件
