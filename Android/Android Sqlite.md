parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Android Sqlite {.heading-level2}
--------------

Android中，对于数据的存贮，有几种方式，有文件方式，有文件式数据库方式,Android自带了一个SQLite数据库，做嵌入开发的人对这个跨平台的本地文件数据库一定不会陌生，在Android对于数据的访问，提出了新的方式，ContentProvider方式，类似于MS的ContentProvider方式的，OLEDB，及ODBC统一的数据方式。\
 我们首先来看看SQLite在
Android中的使用，在Android中有最简单的使用方式，就是利Context对象的openorCreateDatabase\
 我们来看看一段代码：\
 \
 package test.DB;\
 import android.app.Activity;\
 import android.content.Intent;\
 import android.database.Cursor;\
 import android.database.sqlite.SQLiteDatabase;\
 import android.os.Bundle;\
 import android.view.Menu;\
 import android.view.MenuItem;\
 import android.widget.TextView;\
 public class DBActivity extends Activity {

private SQLiteDatabase mdb = null;

/**** Called when the activity is first created. **/\
 @Override\
 public void onCreate(Bundle savedInstanceState) {**

}\
 @Override\
 public boolean onCreateOptionsMenu(Menu menu) {\
 // TODO Auto-generated method stub\
 super.onCreateOptionsMenu(menu); \
 menu.add(1, Menu.FIRST +1, 1, "GetName"); \
 menu.add(1, Menu.FIRST +2, 2, "Test"); \
 return true; \
 }\
 \
 public boolean onOptionsItemSelected(MenuItem item) {\
 // TODO Auto-generated method stub\
 super.onOptionsItemSelected(item);\
 switch (item.getItemId())\
 {\
 case Menu.FIRST+ 1:\
 {\
 TextView tv = (TextView)this.findViewById(R.id.view\_main);\
 tv.setText(this.getName());\
 break;\
 }\
 case Menu.FIRST + 2:\
 {\
 this.setTitle("Del Item...");\
 break;\
 } \
 }\
 return true;\
 }\
 \
 private void initDatabase()\
 {

}\
 private String getName()\
 {

String name = null;\
 \
 Cursor cur = mdb.rawQuery("select \* from test", null);\
 cur.moveToFirst();\
 while (!cur.isLast())\
 {

}\
 return name;

}\
 }\
 我们再来看看单独使用SQLiteOpenHelper方式：\
 先由SQLiteOpenHelper继承一个数据库操作类，其中onCreate,
onUpgrade必须重载并实现，\
 \
 package test.DB;\
 import android.content.Context;\
 import android.database.Cursor;\
 import android.database.sqlite.SQLiteDatabase;\
 import android.database.sqlite.SQLiteOpenHelper;\
 public class DatabaseHelper extends SQLiteOpenHelper {\
 @Override\
 public void onCreate(SQLiteDatabase db) {\
 // TODO Auto-generated method stub \
 }\
 @Override\
 public void onUpgrade(SQLiteDatabase db, int oldVersion, int
newVersion) {\
 // TODO Auto-generated method stub \
 }\
 public DatabaseHelper(Context ct,String dbName)\
 { \
 super(ct,dbName,null,1); \
 } \
 public boolean insert(String insert)\
 {\
 this.getWritableDatabase().execSQL(insert);\
 return true;\
 }\
 public boolean update(String update)\
 {\
 this.getWritableDatabase().execSQL(update);\
 return true;\
 }\
 public boolean delete(String del)\
 {\
 this.getWritableDatabase().execSQL(del);\
 return true;\
 }\
 public Cursor query(String query)\
 {\
 Cursor cur = this.getReadableDatabase().rawQuery(query, null);\
 return cur;\
 }\
 }\
 再创建一个使用者（消费者）\
 \
 package test.DB;\
 import android.app.Activity;\
 import android.content.Intent;\
 import android.database.Cursor;\
 import android.database.sqlite.SQLiteDatabase;\
 import android.os.Bundle;\
 import android.view.Menu;\
 import android.view.MenuItem;\
 import android.widget.TextView;\
 public class DBActivity extends Activity {\
 private SQLiteDatabase mdb = null;\
 private DatabaseHelper helper = null;\
 /\* Called when the activity is first created. \*/\
 @Override\
 public void onCreate(Bundle savedInstanceState) {

}\
 @Override

public boolean onCreateOptionsMenu(Menu menu) {

}\

// TODO Auto-generated method stub\
 super.onOptionsItemSelected(item);\
 switch (item.getItemId())\
 {

case Menu.FIRST+ 1:\
 {

}\
 case Menu.FIRST + 2:\
 {

}

}\
 return true;

}\

private void initDatabase()\
 {

}\
 private String getName()\
 {

String name = null; \
 //mdb = helper.getReadableDatabase();\
 Cursor cur = helper.query("select \* from test");\
 cur.moveToFirst();\
 do\
 {

} while(cur.moveToNext()); \
 \
 return name;

}

}\
 这些代码读起来是不是有点Visual
Basic的感觉？呵呵，所以，以后说不定.net,Android,java,blackberry,最终都成为一致的API，当然，这只是我们的期望，这样大家不必整天花这么多时间学这些无聊的接口了。\
 \

好了，该我们的ContentProvider出场了，与Service,BroadcastReceiver等组件一样，继承特定的Interface，在AndroidManifest.xml里声明这个ContentProvider，调用者就可以拿来使用了。\
 首先我们定义一个ContentProvider:\
 \
 package test.DB;\
 import android.content.ContentProvider;\
 import android.content.ContentValues;\
 import android.database.Cursor;\
 import android.net.Uri;\
 import android.widget.Toast;\
 public class TestProvider extends ContentProvider {

@Override\
 public int delete(Uri arg0, String arg1, String[] arg2) {

}\
 @Override\
 public String getType(Uri uri) {

}\
 @Override\
 public Uri insert(Uri uri, ContentValues values) {

}\
 @Override\
 public boolean onCreate() {

}\
 @Override\
 public Cursor query(Uri uri, String[] projection, String selection,

}\
 @Override\
 public int update(Uri uri, ContentValues values, String selection,

}

}\
 老规矩,[AndroidManifest](AndroidManifest.html).xml来定义这个Provider\
 \

这里的android:authorities =
“com.my.provider”是标识这个ContentProvider，调用者可以根据这个标识来找到它，\
 我们组合一个能找到它的Uri ,\
 \
 public class ProviderConst {

}\
 content 指的是内容提供者ContentProvider。\
 //com.my.provider映射到我们已定义的那个ContentProvider标识\

/test这个作为一个参数，传给ContentProvider，可以根据这个参数来决定操作目标，比如数据库中的哪张表，文件中的那一部分数据等。\
 \
 我们来操作这个内容提供者：\
 \
 private String getName()

{

String name = null; \
 Cursor cur =
this.getContentResolver().query(ProviderConst.MY\_TEST\_URI,new
String[]{"id","name"},null, null, null);\
 if (cur == null)

cur.moveToFirst();\
 do\
 {

} while(cur.moveToNext()); \
 \
 return name;

}

我们也可以这样使用：\
 \
 \
 private String getName()

{

String name = null; \
 Cursor cur = this.managedQuery(ProviderConst.MY\_TEST\_URI,new
String[]{"id","name"},null, null, null);\
 if (cur == null)

cur.moveToFirst();\
 do\
 {

} while(cur.moveToNext()); \
 \
 return name;

}

简单的使用方法我们已了解，那么，我们来分析一下复杂的内容。\
 \
 原文作者：岁月无声\
 \

原文链接：[http://www.cnblogs.com/windwithlife/archive/2009/07/26/1531436.html](http://www.cnblogs.com/windwithlife/archive/2009/07/26/1531436.html)
