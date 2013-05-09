parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

TextView\_HTML {.heading-level2}
--------------

TextView支持html标签如下：\
 There is a lovely method on the android.text.Html class, fromHtml(),
that converts HTML into a Spannable for use with a TextView.\
 \
 However, the documentation does not stipulate what HTML tags are
supported, which makes this method a bit hit-or-miss. More importantly,
it means that you cannot rely on what it will support from release to
release.\
 \
 I have filed an issue requesting that Google formally document what it
intends to support. In the interim, from a quick look at the source
code, here’s what seems to be supported as of Android 2.1:\

使用方法\
 @Override

public void onCreate(Bundle savedInstanceState) {

}\

Html.fromHtml返回的参数Spanned
是CharSequence的子类。textView的setText方法的参数就是CharSequence\
 Spanned mDescription = Html.fromHtml("**Description:**" +
cursor.getString(cursor.getColumnIndex(Course.COLUMN\_COURSE\_DESCRIPTION)));\
 可以把非html和html加在一起传给Html.fromHtml方法\
 \
 注意：\
 但是这样写还没有在1.6和2.2,2.1上产生效果，需要再研究，？？\
 \

mDescription = Html.fromHtml(getString(R.string.description\_bold)


