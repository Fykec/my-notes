parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Android activity and intent {.heading-level2}
---------------------------

Activity\

Android中，Activity是所有程序的根本，所有程序的流程都运行在Activity之中，Activity具有自己的生命周期（见[http://www.cnblogs.com/feisky/archive/2010/01/01/1637427.html，由系统控制生命周期，程序无法改变，但可以用onSaveInstanceState保存其状态）。](http://www.cnblogs.com/feisky/archive/2010/01/01/1637427.html，由系统控制生命周期，程序无法改变，但可以用onSaveInstanceState保存其状态）。)\

对于Activity，关键是其生命周期的把握（如下图），其次就是状态的保存和恢复（onSaveInstanceState
onRestoreInstanceState），以及Activity之间的跳转和数据传输（intent）。\
 \
 Activity中常用的函数有SetContentView() findViewById() finish()
startActivity()，其生命周期涉及的函数有：\
 void onCreate(Bundle savedInstanceState)\
 void onStart()\
 void onRestart()\
 void onResume()\
 void onPause()\
 void onStop()\
 void onDestroy()\

注意的是，Activity的使用需要在Manifest文件中添加相应的，并设置其属性和intent-filter。\
 Intent\

Android中提供了Intent机制来协助应用间的交互与通讯，Intent负责对应用中一次操作的动作、动作涉及数据、附加数据进行描述，Android则根据此Intent的描述，负责找到对应的组件，将
Intent传递给调用的组件，并完成组件的调用。Intent不仅可用于应用程序之间，也可用于应用程序内部的Activity/Service之间的交互。因此，Intent在这里起着一个媒体中介的作用，专门提供组件互相调用的相关信息，实现调用者与被调用者之间的解耦。在SDK中给出了Intent作用的表现形式为：\
 通过Context.startActivity() orActivity.startActivityForResult()
启动一个Activity；\
 通过 Context.startService() 启动一个服务，或者通过Context.bindService()
和后台服务交互；\
 通过广播方法(比如
Context.sendBroadcast(),Context.sendOrderedBroadcast(),
Context.sendStickyBroadcast()) 发给broadcast receivers。\

Intent属性的设置，包括以下几点：（以下为XML中定义，当然也可以通过Intent类的方法来获取和设置）\
 （1）Action，也就是要执行的动作\
 SDk中定义了一些标准的动作，包括\
 onstant Target component Action\
 ACTION\_CALL activity Initiate a phone call.\
 ACTION\_EDIT activity Display data for the user to edit.\
 ACTION\_MAIN activity Start up as the initial activity of a task, with
no data input and no returned output.\
 ACTION\_SYNC activity Synchronize data on a server with data on the
mobile device.\
 ACTION\_BATTERY\_LOW broadcast receiver A warning that the battery is
low.\
 ACTION\_HEADSET\_PLUG broadcast receiver A headset has been plugged
into the device, or unplugged from it.\
 ACTION\_SCREEN\_ON broadcast receiver The screen has been turned on.\
 ACTION\_TIMEZONE\_CHANGED broadcast receiver The setting for the time
zone has changed.\
 \

当然，也可以自定义动作（自定义的动作在使用时，需要加上包名作为前缀，如"com.example.project.SHOW\_COLOR”），并可定义相应的Activity来处理我们的自定义动作。\
 （2）Data，也就是执行动作要操作的数据\

Android中采用指向数据的一个URI来表示，如在联系人应用中，一个指向某联系人的URI可能为：content://contacts/1。对于不同的动作，其URI数据的类型是不同的（可以设置type属性指定特定类型数据），如ACTION\_EDIT指定Data为文件URI，打电话为tel:URI，访问网络为http:URI，而由content
provider提供的数据则为content: URIs。\

（3）type（数据类型），显式指定Intent的数据类型（MIME）。一般Intent的数据类型能够根据数据本身进行判定，但是通过设置这个属性，可以强制采用显式指定的类型而不再进行推导。\
 （4）category（类别），被执行动作的附加信息。例如 LAUNCHER\_CATEGORY
表示Intent
的接受者应该在Launcher中作为顶级应用出现；而ALTERNATIVE\_CATEGORY表示当前的Intent是一系列的可选动作中的一个，这些动作可以在同一块数据上执行。还有其他的为\
 Constant Meaning\
 CATEGORY\_BROWSABLE The target activity can be safely invoked by the
browser to display data referenced by a link — for example, an image or
an e-mail message.\
 CATEGORY\_GADGET The activity can be embedded inside of another
activity that hosts gadgets.\
 CATEGORY\_HOME The activity displays the home screen, the first screen
the user sees when the device is turned on or when the HOME key is
pressed.\
 CATEGORY\_LAUNCHER The activity can be the initial activity of a task
and is listed in the top-level application launcher.\
 CATEGORY\_PREFERENCE The target activity is a preference panel.\
 \
 （5）component（组件），指定Intent的的目标组件的类名称。通常
Android会根据Intent
中包含的其它属性的信息，比如action、data/type、category进行查找，最终找到一个与之匹配的目标组件。但是，如果
component这个属性有指定的话，将直接使用它指定的组件，而不再执行上述查找过程。指定了这个属性以后，Intent的其它所有属性都是可选的。\

（6）extras（附加信息），是其它所有附加信息的集合。使用extras可以为组件提供扩展信息，比如，如果要执行“发送电子邮件”这个动作，可以将电子邮件的标题、正文等保存在extras里，传给电子邮件发送组件。\

理解Intent的关键之一是理解清楚Intent的两种基本用法：一种是显式的Intent，即在构造Intent对象时就指定接收者；另一种是隐式的Intent，即Intent的发送者在构造Intent对象时，并不知道也不关心接收者是谁，有利于降低发送者和接收者之间的耦合。\

对于显式Intent，Android不需要去做解析，因为目标组件已经很明确，Android需要解析的是那些隐式Intent，通过解析，将
Intent映射给可以处理此Intent的Activity、IntentReceiver或Service。 \

Intent解析机制主要是通过查找已注册在AndroidManifest.xml中的所有IntentFilter及其中定义的Intent，最终找到匹配的Intent。在这个解析过程中，Android是通过Intent的action、type、category这三个属性来进行判断的，判断方法如下：\

如果Intent指明定了action，则目标组件的IntentFilter的action列表中就必须包含有这个action，否则不能匹配；\

如果Intent没有提供type，系统将从data中得到数据类型。和action一样，目标组件的数据类型列表中必须包含Intent的数据类型，否则不能匹配。\
 如果Intent中的数据不是content:
类型的URI，而且Intent也没有明确指定它的type，将根据Intent中数据的scheme
（比如 http: 或者[mailto:）](mailto:）) 进行匹配。同上，Intent
的scheme必须出现在目标组件的scheme列表中。\

如果Intent指定了一个或多个category，这些类别必须全部出现在组建的类别列表中。比如Intent中包含了两个类别：LAUNCHER\_CATEGORY
和 ALTERNATIVE\_CATEGORY，解析得到的目标组件必须至少包含这两个类别。\
 Intent-Filter的定义\
 一些属性设置的例子：\
 \
 \
 \
 \
 \
 完整的实例\

\<intent-filter\>

\</intent-filter\>\
 \<intent-filter\>

\</intent-filter\>\
 \<intent-filter\>

\</intent-filter\>

Intent用法实例\
 1.无参数Activity跳转\
 Intent it = new Intent(Activity.Main.this, Activity2.class);\
 startActivity(it); \
 \
 2.向下一个Activity传递数据（使用Bundle和Intent.putExtras）\
 Intent it = new Intent(Activity.Main.this, Activity2.class);\
 Bundle bundle=new Bundle();\
 bundle.putString("name", "This is from MainActivity!");\
 it.putExtras(bundle); // it.putExtra(“test”, "shuju”);\
 startActivity(it); // startActivityForResult(it,REQUEST\_CODE);\
 \
 对于数据的获取可以采用：\
 Bundle bundle=getIntent().getExtras();\
 String name=bundle.getString("name");\
 \

3.向上一个Activity返回结果（使用setResult，针对startActivityForResult(it,REQUEST\_CODE)启动的Activity）

4.回调上一个Activity的结果处理函数（onActivityResult）\
 @Override

protected void onActivityResult(int requestCode, int resultCode, Intent
data) {

// TODO Auto-generated method stub\
 super.onActivityResult(requestCode, resultCode, data);\
 if (requestCode==REQUEST\_CODE){

if(resultCode==RESULT\_CANCELED)

else if (resultCode==RESULT\_OK) {

}

}

}

下面是转载来的其他的一些Intent用法实例（转自javaeye）\
 显示网页

1.  2.  3.  

显示地图

1.  2.  3.  4.  5.  6.  7.  8.  9.  

路径规划

1.  2.  3.  4.  

打电话

1.  2.  3.  4.  5.  6.  7.  8.  9.  10. 

传送SMS/MMS

1.  2.  3.  4.  5.  6.  7.  8.  9.  10. 11. 12. 13. 14. 15. 16. 17. 

传送 Email

1.  2.  3.  4.  5.  6.  7.  8.  9.  10. 11. 12. 13. 14. 15. 16. 17. 18. 19. 20. 21. 22. 23. 

播放多媒体

Market 相关\
 1. //寻找某个应用 \
 2. Uri uri = Uri.parse("market://search?q=pname:pkg\_name"); \
 3. Intent it = new Intent(Intent.ACTION\_VIEW, uri); \
 4. startActivity(it); \
 5. //where pkg\_name is the full package path for an application \
 1. //显示某个应用的相关信息 \
 2. Uri uri = Uri.parse("market://details?id=app\_id"); \
 3. Intent it = new Intent(Intent.ACTION\_VIEW, uri); \
 4. startActivity(it); \
 5. //where app\_id is the application ID, find the ID \
 6. //by clicking on your application on Market home \
 7. //page, and notice the ID from the address bar\
 Uninstall 应用程序\
 1. Uri uri = Uri.fromParts("package", strPackageName, null); \
 2. Intent it = new Intent(Intent.ACTION\_DELETE, uri); \
 3. startActivity(it); \
 \
 作者：Feisky \
 出处：[http://www.cnblogs.com/feisky/](http://www.cnblogs.com/feisky/)
