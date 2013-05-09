parent nodes: [Error handling](Error%20handling.html)\
\

Activity has leaked window that was originally added {.heading-level2}
----------------------------------------------------

在编写Android程序的时候，遇到一个隐藏性问题。仔细查看LogCat，错误信息如下：\
 \
 10-31 13:03:34.549: ERROR/WindowManager(444): Activity
com.iqiwu.android.NoticeActivity has leaked window
com.android.internal.policy.impl.PhoneWindow\$DecorView@437d1570 that
was originally added here\
 \
 10-31 13:03:34.549: ERROR/WindowManager(444):
android.view.WindowLeaked: Activity com.iqiwu.android.NoticeActivity has
leaked window
com.android.internal.policy.impl.PhoneWindow\$DecorView@437d1570 that
was originally added here\
 \
 10-31 13:03:34.549: ERROR/WindowManager(444): at
android.view.ViewRoot.(ViewRoot.java:214)\
 \
 10-31 13:03:34.549: ERROR/WindowManager(444): at
android.view.WindowManagerImpl.addView(WindowManagerImpl.java:148)\
 \
 10-31 13:03:34.549: ERROR/WindowManager(444): at
android.view.WindowManagerImpl.addView(WindowManagerImpl.java:91)\
 \
 10-31 13:03:34.549: ERROR/WindowManager(444): at
android.view.Window\$LocalWindowManager.addView(Window.java:409)\
 \
 10-31 13:03:34.549: ERROR/WindowManager(444): at
android.app.Dialog.show(Dialog.java:238)\
 \
 10-31 13:03:34.549: ERROR/WindowManager(444): at
android.app.AlertDialog\$Builder.show(AlertDialog.java:802)\
 \
 10-31 13:03:34.549: ERROR/WindowManager(444): at
com.iqiwu.android.NoticeActivity.setAlarmNotice(NoticeActivity.java:139)\
 \
 10-31 13:03:34.549: ERROR/WindowManager(444): at
com.iqiwu.android.NoticeActivity.onCreate(NoticeActivity.java:68)\
 \
 10-31 13:03:34.549: ERROR/WindowManager(444): at
android.app.Instrumentation.callActivityOnCreate(Instrumentation.java:1123)\
 \
 ……\
 \
 从错误提示中可以看出，错误产生过程如下：NoticeActivity.onCreate -\>
NoticeActivity.setAlarmNotice -\>
AlertDialog\$Builder.show，于是发现错误，在关闭Activity的时候，没有关闭AlertDialog！！！\
 \
 解决方法：\
 \

我们知道，在关闭Activity的时候，Activity会调用自己的onPause函数，只要在这里关闭AlertDialog就可以啦！！！至于怎么关闭，其实很简单，调用AlertDialog.dismiss();就可以了。O(∩\_∩)o
哈哈
