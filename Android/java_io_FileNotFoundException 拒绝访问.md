parent nodes: [Error handling](Error%20handling.html)\
\

java\_io\_File Not Found Exception 拒绝访问 {.heading-level2}
-------------------------------------------

File file = new File("e:/local/sss");\
 用这种形式访问文件（不带后缀名），就会产生这个错误，\
 \
 正确的方式是要\
 File file = new File("e:/local/sss.txt");
