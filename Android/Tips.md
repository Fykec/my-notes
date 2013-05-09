parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Tips {.heading-level2}
----

​1. 在activity中启动的Dialog不要忘了在onPause中来关掉。！！\
 \
 2. startServic和stopSevice的intent不能为空\
 \
 3. 查询时Cursor用完后必须关闭。\
 \
 4. LinearLayout
的默认排布方向是水平的，所以想显示竖直的列表一定要设置android：orientation=“vertical”！！\
 5. json 存网址不用转义，json可以读 / 和 ： 只是json自己存的时候会把 /
在JsonObject中存成/，刚才的错误可能是不正确的编码的字符造成的，我字符串是从
doc文档考下来的\
 6.
Class.forName(-\#34;sun.jdbc.odbc.JdbcOdbcDriver-\#34;);这个类在%JAVA\_HOME%/jre/lib/rt.jar\
 7. 插入数据库是 ‘ 这个符号需要转义才能存进去。用URLEncoder.encode().\
 8. notepad
的replace功能相当强悍，有时候自己写的正则表达式找不到的可以用这个！！！\
 9. ctrl + h是替换功能 notpad和excel中都是。\
 10. 设置字体样式用标签不用css，因为IE不兼容\
 11. Html 标签用本地文件
![](file:///E|/learning_story/20110214/html/header_03.jpg)\
 12. LinearLayout的android:orientation

android:orientation="vertical"
android:background="@drawable/bg\_title4"\>

\<LinearLayout

android:orientation="vertical"//连两子view将上线排列\
 android:layout\_height="wrap\_content"\
 android:layout\_width="fill\_parent"\>\
 \
 \<!-- Ad View --\>

\
 \
 \
 \<LinearLayout style="@style/Layout.Foot"
android:layout\_alignParentBottom="true"

android:orientation="vertical"
android:background="@drawable/bg\_title4"\>

\<LinearLayout

android:layout\_height="wrap\_content"//连两子view将重合\
 android:layout\_width="fill\_parent"\>\
 \
 \<!-- Ad View --\>

\
 \

​13. 数据库操作 like， 一定要写成下面的方式，在
SEARCH\_LOCAL\_SONG\_INFO\_SELECTION只写个问号，Android会包装不用谢单引号，百分号也不要写在SEARCH\_LOCAL\_SONG\_INFO\_SELECTION中\
 public Cursor searchLocalSongsCursor(String keyword) {

Cursor cursor = mContext.getContentResolver().query(

return cursor;

​14. 忽略大小写的排序关键字是 COLLATE NOCASE 例如 ORDER BY title COLLATE
NOCASE ASC\
 15. 合并Cursor的类很有用 Cursor cursor = new MergeCursor(new Cursor[] {
cursor1, cursor2 });\
 16. EditText
屏蔽软键盘弹出android:inputType="none"，告诉系统自己什么都不输入就好了\
 17. EditText
设置为singleLine模式，则键盘的回车键会自动编程“下一步”的按键，点了进入下一个EditText\
 18. center\_vertical|right gravity的属性可以同时作用\
 19. 同时支持 320**480（mdpi） 和480**800
（hdpi），可以用连用layout和layout-hdpi来区别\
 20.
使用cursor之前要调用cursor的move方法比如moveToFirst（），如果在没有调用任何move方法之前，取cursor中的值，就会出现以下的exception\
 android.database.CursorIndexOutOfBoundsException: Index -1 requested,
with a size of 1\

