parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

解决GridView中ImageView大小不受约束的问题（比如，设置ImageView大小，在模拟器上没反应） {.heading-level2}
--------------------------------------------------------------------------------------

核心就是在ImageView外面围一层Layout，并且大小和ImageView设置的大小相同，可以用LinearLayout和FrameLayout最好用LinearLayout，FrameLayout在有的手机上没有反应，比如1.6
G2\
 \
 gridview\_item.xml\
 \
 \<?xml version="1.0" encoding="utf-8"?\>\
 \<LinearLayout

\
 \

然后重写Adapter的getView方法调用这个xml文件，要返回父容器convertView，而不是imageView这个子view\
 \
 @Override

public View getView(int position, View convertView, ViewGroup parent) {

if (convertView == null) {

convertView = mInflater.inflate(R.layout.gridview\_item, null);\
 holder = new ViewHolder();\
 holder.mImageView = ([ImageView](ImageView.html)) convertView

holder.mImageView.setImageResource(getImageId(position));\
 convertView.setTag(holder);

} else {

}

}

[file:///C:/Users/jjyin/Desktop/V%20Player%20-%20快捷方式.lnk](file:///C:/Users/jjyin/Desktop/V%20Player%20-%20快捷方式.lnk)

static class ViewHolder {

}
