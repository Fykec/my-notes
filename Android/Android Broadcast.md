parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Android Broadcast {.heading-level2}
-----------------

发送代码：

Intent intent = new Intent();//不要设置成Intent intent = new
Intent(mCtx, XxActivity.class);

接收代码\
 \
 onCreate()中注册

mReceiver = new LocalPageBroadcastReceiver();

onDestroy()中注销\
 if (null != mReceiver) {

具体操作就写在实现类中\

private class LocalPageBroadcastReceiver extends BroadcastReceiver {\

@Override\
 public void onReceive(Context context, Intent intent) {

if (null != intent) {

}\

}\


