parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Sting stringbuilder stringbuffer {.heading-level2}
--------------------------------

转自java家，原贴地址[http://www.javajia.net/viewtopic.php?p=90391](http://www.javajia.net/viewtopic.php?p=90391)\

String S1 = “abc”; \
 For(int I = 0 ; I \< 10000 ; I ++) // For 模拟程序的多次调用 \
 { \
 S1 + = “def”; \
 S1 = “abc”; \
 }\

String S1 = “This is only a” + “ simple” + “ test”; \
 StringBuffer Sb = new StringBuilder(“This is only a”).append(“
simple”).append(“ test”); \

String S1 = “This is only a” + “ simple” + “test”; 其实就是： String S1
= “This is only a simple test”;
所以当然不需要太多的时间了。但大家这里要注意的是，如果你的字符串是来自另外的
String 对象的话，速度就没那么快了，譬如： \
 \
 String S2 = “This is only a”; \
 String S3 = “ simple”; \
 String S4 = “ test”; \
 String S1 = S2 +S3 + S4; \

public class testssb { \
 \
 /**** Creates a new instance of testssb \*/ \
 final static int ttime = 10000;// 测试循环次数 \
 public testssb() { \
 } \
 \
 public void test(String s){ \
 long begin = System.currentTimeMillis(); \
 for(int i=0;i\<ttime;i++){ \
 s += "add"; \
 }\
 long over = System.currentTimeMillis(); \
 System.out.println(" 操作 "+s.getClass().getName()+" 类型使用的时间为：
" + (over - begin) + " 毫秒 " ); \
 } \
 \
 public void test(StringBuffer s){ \
 long begin = System.currentTimeMillis(); \
 for(int i=0;i\<ttime;i++){ \
 s.append("add"); \
 } \
 long over = System.currentTimeMillis(); \
 System.out.println(" 操作 "+s.getClass().getName()+" 类型使用的时间为：
" + (over - begin) + " 毫秒 " ); \
 } \
 \
 public void test(StringBuilder s){ \
 long begin = System.currentTimeMillis(); \
 for(int i=0;i\<ttime;i++){ \
 s.append("add"); \
 } \
 long over = System.currentTimeMillis(); \
 System.out.println(" 操作 "+s.getClass().getName()+" 类型使用的时间为：
" + (over - begin) + " 毫秒 " ); \
 } \
 \
 // 对 String 直接进行字符串拼接的测试 \
 public void test2(){ \
 String s2 = "abadf"; \
 long begin = System.currentTimeMillis(); \
 for(int i=0;i\<ttime;i++){ \
 String s = s2 + s2 + s2 ; \
 } \
 long over = System.currentTimeMillis(); \
 System.out.println(" 操作字符串对象引用相加类型使用的时间为： " + (over
- begin) + " 毫秒 " ); \
 } \
 \
 public void test3(){ \
 long begin = System.currentTimeMillis(); \
 for(int i=0;i\<ttime;i++){ \
 String s = "abadf" + "abadf" + "abadf" ; \
 } \
 long over = System.currentTimeMillis(); \
 System.out.println(" 操作字符串相加使用的时间为： "+ (over - begin) + "
毫秒 " ); \
 } \
 \
 public static void main(String[] args){ \
 String s1 ="abc"; \
 StringBuffer sb1 = new StringBuffer("abc"); \
 StringBuilder sb2 = new StringBuilder("abc"); \
 \
 testssb t = new testssb(); \
 t.test(s1); \
 t.test(sb1);\
 t.test(sb2); \
 t.test2(); \
 t.test3(); \
 } \
 } \

操作 java.lang.String 类型使用的时间为： 4392 毫秒 \
 操作 java.lang.StringBuffer 类型使用的时间为： 0 毫秒 \
 操作 java.lang.StringBuilder 类型使用的时间为： 0 毫秒 \
 操作字符串对象引用相加类型使用的时间为： 15 毫秒 \
 操作字符串相加使用的时间为： 0 毫秒 \

操作 java.lang.String 类型使用的时间为： 53444 毫秒 \
 操作 java.lang.StringBuffer 类型使用的时间为： 15 毫秒 \
 操作 java.lang.StringBuilder 类型使用的时间为： 15 毫秒 \
 操作字符串对象引用相加类型使用的时间为： 31 毫秒 \
 操作字符串相加使用的时间为： 0 毫秒 \

操作 java.lang.StringBuffer 类型使用的时间为： 31 毫秒 \
 操作 java.lang.StringBuilder 类型使用的时间为： 16 毫秒 \

操作 java.lang.StringBuffer 类型使用的时间为： 265 毫秒 \
 操作 java.lang.StringBuilder 类型使用的时间为： 219 毫秒 \

······ Exception in thread "main" java.lang.OutOfMemoryError: Java heap
space ······ \


