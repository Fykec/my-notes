parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

android拷贝数据库 {.heading-level2}
-----------------

[http://www.189works.com/article-10630-1.html](http://www.189works.com/article-10630-1.html)\
 \
 res/raw 里面放的数据库文件 最大不能超过1M\
 \

[http://www.devdiv.com/thread-46593-1-1.html](http://www.devdiv.com/thread-46593-1-1.html)\

把60M的数据库压缩成Zip后放到Assets里。当程序运行的时候，把zip复制到你指定的位置并解压缩。Assets下对于压缩文件不受1M大小的限制。\
 \

按你的方法做在真机上是可以的，不过把数据库文件拷贝到模拟器上，我试了最多只能拷贝33M（34,004,992byte），数据库文件应该是拷到手机内存里面好像\
 我的模拟器设置是\
 hw.ramsize:600\
 vm.heapsize:200\
 \
 写拷贝压缩文件，再在database的数据库路径解压\
 \
 代码实现如下\

/********************************************************************************************

package com.opencourse.database;\
 \
 import java.io.File;\
 import java.io.FileOutputStream;\
 import java.io.IOException;\
 import java.io.InputStream;\
 \
 import android.content.Context;\
 \
 import com.opencourse.util.UnZip;\
 \
 public class DbUtil {\

private static final int BUFFER\_SIZE\_DEFAULT = 4096;\
 \
 public static void ensureDb(final Context context) {

File dbFilePath = context.getDatabasePath(DbHelper.DB\_NAME);\
 dbFilePath.getParentFile().mkdirs();\
 if(true){

}

}\
 \
 \
 public static void copyZipFile(Context context, File path) {

path.getParentFile().mkdirs();\
 if(true){

try {

InputStream stream = context.getAssets().open("opencourse.zip");\
 FileOutputStream out = new FileOutputStream(path);\
 byte[] buffer = new byte[BUFFER\_SIZE\_DEFAULT];\
 int size = 0;\
 while ((size = stream.read(buffer)) != -1) {

}\
 out.flush();\
 stream.close();\
 out.close();\

} catch (IOException e) {

}

}

}\
 \
 public static void deleteZipFile(File path) {

try {

if (path.exists()) {

}

} catch (Exception ex) {\
 }\

}

}\
 \
 package com.opencourse.util;\
 import java.io.BufferedInputStream;\
 import java.io.BufferedOutputStream;\
 import java.io.File;\
 import java.io.FileOutputStream;\
 import java.util.Enumeration;\
 import java.util.zip.ZipEntry;\
 import java.util.zip.ZipFile;\
 \
 public class UnZip {

static final int BUFFER = 2048;\
 \
 public static void unzip(String inputFileName, String outputPath) {

try {

Enumeration emu = zipFile.entries();

while(emu.hasMoreElements()){

ZipEntry entry = (ZipEntry)emu.nextElement();\

//会把目录作为一个file读出一次，所以只建立目录就可以，之下的文件还会被迭代到。\
 if (entry.isDirectory())\
 {

}\
 BufferedInputStream bis = new
BufferedInputStream(zipFile.getInputStream(entry));\
 File file = new File(filePath + "/" + entry.getName());\

//加入这个的原因是zipfile读取文件是随机读取的，这就造成可能先读取一个文件\
 //而这个文件所在的目录还没有出现过，所以要建出目录来。\
 File parent = file.getParentFile();\
 if(parent != null && (!parent.exists())){

}\
 FileOutputStream fos = new FileOutputStream(file);\
 BufferedOutputStream bos = new BufferedOutputStream(fos,BUFFER); \
 \
 int count;\
 byte data[] = new byte[BUFFER];\
 while ((count = bis.read(data, 0, BUFFER)) != -1)\
 {

}\
 bos.flush();\
 bos.close();\
 bis.close();

}\
 zipFile.close();

} catch (Exception e) {

}

}\
 \
 \

