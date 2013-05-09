parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Serializable and Parcellable {.heading-level2}
----------------------------

大家好，好久不见，今天要给大家讲一下Android中Intent中如何传递对象,就我目前所知道的有两种方法，一种是Bundle.putSerializable(Key,Object);另一种是Bundle.putParcelable(Key,
Object);当然这些Object是有一定的条件的，前者是实现了Serializable接口，而后者是实现了Parcelable接口，为了让大家更容易理解我还是照常写了一个简单的Demo,大家就一步一步跟我来吧！\
 \

第一步:新建一个Android工程命名为ObjectTranDemo(类比较多哦!)目录结构如下图:\
 \
 \
 \
 第二步:修改main.xml布局文件(这里我增加了两个按钮)代码如下\
 \
 view plaincopy to clipboardprint?\
 \<?xml version="1.0" encoding="utf-8"?\> \
 \<LinearLayout
xmlns:android="[http://schemas.android.com/apk/res/android](http://schemas.android.com/apk/res/android)"

\<TextView

\<Button

/\> \
 \<Button

/\> \
 \

第三步:新建两个类一个是Person.java实现Serializable接口，另一个Book.java实现Parcelable接口，代码分别如下:\
 \
 Person.java:\
 \
 view plaincopy to clipboardprint?\
 package com.tutor.objecttran; \
 import java.io.Serializable; \
 public class Person implements Serializable {

private static final long serialVersionUID = -7060210544600464481L; \
 private String name; \
 private int age; \
 public String getName() {

} \
 public void setName(String name) {

} \
 public int getAge() {

} \
 public void setAge(int age) {

} \

} \
 Book.java:\
 \
 view plaincopy to clipboardprint?\
 package com.tutor.objecttran; \
 import android.os.Parcel; \
 import android.os.Parcelable; \
 public class Book implements Parcelable {

private String bookName; \
 private String author; \
 private int publishTime; \
 \
 public String getBookName() {

} \
 public void setBookName(String bookName) {

} \
 public String getAuthor() {

} \
 public void setAuthor(String author) {

} \
 public int getPublishTime() {

} \
 public void setPublishTime(int publishTime) {

} \
 \
 public static final Parcelable.Creator CREATOR = new Creator() {

public Book createFromParcel(Parcel source) {

} \
 public Book[] newArray(int size) {

}

}; \
 \
 public int describeContents() {

} \
 public void writeToParcel(Parcel parcel, int flags) {

}

} \

第四步:修改ObjectTranDemo.java,并且新建两个Activity,一个是ObjectTranDemo1.java,别一个是ObjectTranDemo2.java.分别用来显示Person对像数据，和Book对象数据:,代码分别如下：\
 \
 ObjectTranDemo.java:\
 \
 view plaincopy to clipboardprint?\
 package com.tutor.objecttran; \
 import android.app.Activity; \
 import android.content.Intent; \
 import android.os.Bundle; \
 import android.view.View; \
 import android.view.View.OnClickListener; \
 import android.widget.Button; \
 public class ObjectTranDemo extends Activity implements OnClickListener
{ \

private Button sButton,pButton; \
 public final static String SER\_KEY = "com.tutor.objecttran.ser"; \
 public final static String PAR\_KEY = "com.tutor.objecttran.par"; \
 public void onCreate(Bundle savedInstanceState) {

} \
 \
 //我的一贯作风呵呵 \
 public void setupViews(){

} \
 //Serializeable传递对象的方法 \
 public void SerializeMethod(){

} \
 //Pacelable传递对象方法 \
 public void PacelableMethod(){

} \
 //铵钮点击事件响应 \
 public void onClick(View v) {

if(v == sButton){

}else{

}

}

} \
 ObjectTranDemo1.java:\
 \
 view plaincopy to clipboardprint?\
 package com.tutor.objecttran; \
 import android.app.Activity; \
 import android.os.Bundle; \
 import android.widget.TextView; \
 public class ObjectTranDemo1 extends Activity {

@Override \
 public void onCreate(Bundle savedInstanceState) {

super.onCreate(savedInstanceState); \
 \
 TextView mTextView = new TextView(this); \
 Person mPerson =
(Person)getIntent().getSerializableExtra(ObjectTranDemo.SER\_KEY); \
 mTextView.setText("You name is: " + mPerson.getName() + "n"+

setContentView(mTextView);

}

} \
 ObjectTranDemo2.java:\
 \
 view plaincopy to clipboardprint?\
 package com.tutor.objecttran; \
 import android.app.Activity; \
 import android.os.Bundle; \
 import android.widget.TextView; \
 public class ObjectTranDemo2 extends Activity { \

public void onCreate(Bundle savedInstanceState) {

super.onCreate(savedInstanceState); \
 TextView mTextView = new TextView(this); \
 Book mBook =
(Book)getIntent().getParcelableExtra(ObjectTranDemo.PAR\_KEY); \
 mTextView.setText("Book name is: " + mBook.getBookName()+"n"+

setContentView(mTextView);

}

} \

第五步:比较重要的一步啦，修改AndroidManifest.xml文件（将两个新增的Activity，ObjectTranDemo1,ObjectTranDemo2)申明一下代码如下(第14，15行):\
 \
 view plaincopy to clipboardprint?\
 \<?xml version="1.0" encoding="utf-8"?\> \
 \<manifest
xmlns:android="[http://schemas.android.com/apk/res/android](http://schemas.android.com/apk/res/android)"

\<activity android:name=".ObjectTranDemo"

\<intent-filter\>

\</intent-filter\>

\
 \

\
 \<uses-sdk android:minSdkVersion="7" /\>

\
 第六步:运行上述工程查看效果图啦:\
 \
 效果1：首界面:\
 \
 \
 \
 效果2:点击Serializable按钮\
 \
 \
 \
 效果3:点击Parcelable按钮:\
 \

