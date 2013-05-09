parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Wake lock {.heading-level2}
---------

前言\

　　学习android一段时间了，为了进一步了解android的应用是如何设计开发的，决定详细研究几个开源的android应用。从一些开源应用中吸收点东西，一边进行量的积累，一边探索android的学习研究方向。这里我首先选择了jwood的
Standup Timer 项目。本文将把研究的内容笔记整理，建立一个索引列表。\
 PowerManager.WakeLock\
 　　PowerManager.WakerLock是我分析Standup
Timer源代码时发现的一个小知识点，Standup Timer
用WakeLock保证程序运行时保持手机屏幕的恒亮（程序虽小但也做得相当的细心，考虑的很周到）。PowerManager
和PowerManager.WakerLock7用于对Android设备的电源进行管理。\
 　　PowerManager:This class gives you control of the power state of the
device.\
 　　PowerManager.WakeLock: lets you say that you need to have the
device on.\

　　Android中通过各种Lock锁对电源进行控制，需要注意的是加锁和解锁必须成对出现。先上一段Standup
Timer里的代码然后进行说明。\
 代码\
 private void acquireWakeLock() {

if (wakeLock == null) {

private void releaseWakeLock() {

if (wakeLock != null && wakeLock.isHeld()) {

}\

acquireWakeLock()方法中获取了 SCREEN\_DIM\_WAKE\_LOCK锁，该锁使 CPU
保持运转，屏幕保持亮度（可以变灰）。这个函数在Activity的
onResume中被调用。releaseWakeLock()方法则是释放该锁。它在Activity的
onPause中被调用。利用Activiy的生命周期，巧妙的让
acquire()和release()成对出现。

@Override\
 protected void onResume()\
 {

super.onResume();

acquireWakeLock();\
 startTimer();

}

代码\
 \
 PowerManager和WakeLock的操作步骤\
 　　PowerManager pm = (PowerManager)
getSystemService(Context.POWER\_SERVICE);通过
Context.getSystemService().方法获取PowerManager实例。\
 　　然后通过PowerManager的newWakeLock((int flags, String
tag)来生成WakeLock实例。int Flags指示要获取哪种WakeLock，不同的Lock对cpu
、屏幕、键盘灯有不同影响。\

　　获取WakeLock实例后通过acquire()获取相应的锁，然后进行其他业务逻辑的操作，最后使用release()释放（释放是必须的）。\
 关于int flags\
 　　各种锁的类型对CPU 、屏幕、键盘的影响：\
 PARTIAL\_WAKE\_LOCK:保持CPU 运转，屏幕和键盘灯有可能是关闭的。\
 SCREEN\_DIM\_WAKE\_LOCK：保持CPU
运转，允许保持屏幕显示但有可能是灰的，允许关闭键盘灯\
 SCREEN\_BRIGHT\_WAKE\_LOCK：保持CPU
运转，允许保持屏幕高亮显示，允许关闭键盘灯\
 FULL\_WAKE\_LOCK：保持CPU 运转，保持屏幕高亮显示，键盘灯也保持亮度\
 ACQUIRE\_CAUSES\_WAKEUP：Normal wake locks don't actually turn on the
illumination. Instead, they cause the illumination to remain on once it
turns on (e.g. from user activity). This flag will force the screen
and/or keyboard to turn on immediately, when the WakeLock is acquired. A
typical use would be for notifications which are important for the user
to see immediately.\
 ON\_AFTER\_RELEASE：f this flag is set, the user activity timer will be
reset when the WakeLock is released, causing the illumination to remain
on a bit longer. This can be used to reduce flicker if you are cycling
between wake lock conditions.\
 权限获取\

要进行电源的操作需要在AndroidManifest.xml中声明该应用有设置电源管理的权限。\
 \<uses-permission android:name="android.permission.WAKE\_LOCK" /\>\
 你可能还需要\
 \<uses-permission android:name="android.permission.DEVICE\_POWER" /\>\
 另外WakeLock的设置是 Activiy 级别的，不是针对整个Application应用的。
