parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

从xml文件装载界面 {.heading-level2}
-----------------

LinearLayout tv = (LinearLayout) LinearLayout.inflate(this,
R.layout.image\_list\_item, null);

TextView leftTextView = (TextView)
tv.findViewById(R.id.image\_list\_item\_text);\
 leftTextView.setText("Add list");\
 leftTextView.setPadding(DisplayManager.dipToPixel(18), 0, 0, 0);\
 [ImageView](ImageView.html) rightSideImageView =
([ImageView](ImageView.html))
tv.findViewById(R.id.image\_list\_item\_image);//用新iew的findViewById（）\
 rightSideImageView.setBackgroundResource(R.drawable.ico\_add\_list);\
 LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(

params.leftMargin = DisplayManager.dipToPixel(190);\
 params.width = DisplayManager.dipToPixel(29);\
 params.height = DisplayManager.dipToPixel(29);\
 params.gravity = Gravity.CENTER\_VERTICAL;\
 rightSideImageView.setLayoutParams(params);
