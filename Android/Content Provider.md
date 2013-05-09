parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Content Provider {.heading-level2}
----------------

Content Provider
属于Android应用程序的组件之一，作为应用程序之间唯一的共享数据的途径，Content
Provider
主要的功能就是存储并检索数据以及向其他应用程序提供访问数据的借口。 \

让自己的数据和其他应用程序共享有两种方式：创建自己的Content
Provier(即继承自ContentProvider的子类)
或者是将自己的数据添加到已有的Content
Provider中去，后者需要保证现有的Content
Provider和自己的数据类型相同且具有该 Content
Provider的写入权限。对于Content Provider，最重要的就是数据模型(data
model) 和 URI。 \
 \
 1.数据模型

2.URI

URI，每一个Content Provider 都对外提供一个能够唯一标识自己数据集(data
set)的公开URI, 如果一个Content
Provider管理多个数据集，其将会为每个数据集分配一个独立的URI。所有的Content
Provider 的URI 都以"content://"
开头，其中"content:"是用来标识数据是由Content Provider管理的 schema。 \

提示： 如果需要访问特定的某条数据记录，只需该记录的ID 即可。 \

查询Content Provider的方法有两个：ContentResolver的query() 和 Activity
对象的 managedQuery(),二者接收的参数均相同，返回的都是Cursor
对象，唯一不同的是 使用managedQuery 方法可以让Activity 来管理 Cursor
的生命周期。 \
 \
 被管理的Cursor 会在 Activity进入暂停状态的时候调用自己的 deactivate
方法自行卸载，而在Activity回到运行状态时会调用自己的requery
方法重新查询生成的Cursor对象。如果一个未被管理的Cursor对象想被Activity管理，可以调用Activity的
startManagingCursor方法来实现。 \

大家先来看一下我手机上都有哪些联系人吧，见下图。 \
 \
 \
 \
 下边我们就来看代码吧比较简单了，只有一个类Activity01 \
 Java代码 \
 package xiaohang.zhimeng; \
 \
 import android.app.Activity; \
 import android.content.ContentResolver; \
 import android.database.Cursor; \
 import android.graphics.Color; \
 import android.net.Uri; \
 import android.os.Bundle; \
 import android.provider.ContactsContract; \
 import android.widget.TextView; \
 \
 public class Activity01 extends Activity {

//查询Content Provider时希望返回的列 \
 String [] columns = {

}; \
 \
 Uri contactUri = ContactsContract.Contacts.CONTENT\_URI; \
 TextView tv; \
 //Uri contaUri = Contacts.People.CONTENT\_URI; \
 \
 @Override \
 public void onCreate(Bundle savedInstanceState) {

} \
 //获取联系人列表的信息,返回 String对象 \
 public String getQueryData(){

String result = ""; \
 //获取ContentResolver对象 \
 ContentResolver resolver = getContentResolver(); \
 Cursor cursor = resolver.query(contactUri, columns, null, null, null);
\
 //获得\_ID字段的索引 \
 int idIndex = cursor.getColumnIndex(ContactsContract.Contacts.\_ID); \
 //获得Name字段的索引 \
 int nameIndex =
cursor.getColumnIndex(ContactsContract.Contacts.DISPLAY\_NAME); \
 //遍历Cursor提取数据 \
 for (cursor.moveToFirst();(!cursor.isAfterLast());cursor.moveToNext())
{

} \
 cursor.close(); \
 return result;

}

} \
 \
 \
 下面是运行后的效果 \
 \
 \
 \
 最后在提醒大家一下不要忘记加权限 \
 \<uses-permission android:name="android.permission.READ\_CONTACTS" /\>
\

