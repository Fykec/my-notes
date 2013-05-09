parent nodes: [Error handling](Error%20handling.html)\
\

java\_util\_No Such Element Exception {.heading-level2}
-------------------------------------

写了一个从A文件复制到B文件的例子，其中要求去掉重复的行。\
 \
 于是想到了Set，这本来是很容易的事情，结果在向外写数据时抱错\
 \
 java.util.NoSuchElementException\
 \

网络上反复查证也没有相关的内容，于是自己慢慢的找，终于找到了。下面写出这个错误的例子及分析，希望能及时的帮助和我同样犯了小错误的菜鸟！\
 \
 import java.io.BufferedReader;\
 import java.io.BufferedWriter;\
 import java.io.File;\
 import java.io.FileInputStream;\
 import java.io.FileOutputStream;\
 import java.io.IOException;\
 import java.io.InputStream;\
 import java.io.InputStreamReader;\
 import java.io.OutputStream;\
 import java.io.OutputStreamWriter;\
 import java.io.PrintWriter;\
 import java.util.HashSet;\
 import java.util.Iterator;\
 import java.util.Set;\
 \
 public class Step01 {\

public static void main(String[] args) {

Set set = new HashSet();\
 File in = new File("Answer0712/aaa.txt");\
 File out = new File("Answer0712/bbb.txt");\
 InputStream is = null;\
 OutputStream os = null;\
 try {

is = new FileInputStream(in);\
 os = new FileOutputStream(out);\
 BufferedReader br = new BufferedReader(new InputStreamReader(is));\
 while (true) {

String str = br.readLine();\
 if (str == null)

set.add(str);

}\
 // Iterator i = set.iterator();\
 // while(i.hasNext()){\
 // System.out.println("Null值判断："+i.next());\
 // }\
 PrintWriter pw = new PrintWriter(new BufferedWriter(

Iterator i = set.iterator();\
 while (i.hasNext()) {\
 *System.out.println(i.next()); //这一句是罪魁祸首****\**

}\
 pw.flush();

} catch (Exception e) {

} finally {

try {

} catch (IOException e) {

}\

}\

}

}\
 \

文章中标示黄色的那一句，本来是要打印出来，在控制台看看所写的数据是否正确。\
 \
 结果就出现了java.util.NoSuchElementException的错误提示
，就是黄色的那一句，多了一个 迭代器的next（）。\
 \
 所以错了。去掉它就好了，或者改为\
 \
 while (i.hasNext()) {


