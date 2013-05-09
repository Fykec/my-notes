parent nodes: [Error handling](Error%20handling.html)\
\

找不到proguard\_cfg {.heading-level2}
-------------------

是不是更新完2.3出现的问题.今天我也报了这异常.这文件是混淆插件用的配置信息,你可以让其他人传你个.或者用我这里的\>\>\>\>
proguard.rar (1.01 KB, 下载次数: 631) \
 \
 \
 -optimizationpasses 5\
 -dontusemixedcaseclassnames\
 -dontskipnonpubliclibraryclasses\
 -dontpreverify\
 -verbose\
 -optimizations
!code/simplification/arithmetic,!field/**,!class/merging/**\
 \
 -keep public class \* extends android.app.Activity\
 -keep public class \* extends android.app.Application\
 -keep public class \* extends android.app.Service\
 -keep public class \* extends android.content.BroadcastReceiver\
 -keep public class \* extends android.content.ContentProvider\
 -keep public class com.android.vending.licensing.ILicensingService\
 \
 -keepclasseswithmembernames class \* {

}\
 \
 -keepclasseswithmembernames class \* {

}\
 \
 -keepclasseswithmembernames class \* {

}\
 \
 -keepclassmembers enum \* {

}\
 \
 -keep class \* implements android.os.Parcelable {

}\
 这是文件中的内容.你试试.可能我上传的文件有问题.路径要放正确了.\

