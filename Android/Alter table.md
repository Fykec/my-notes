parent nodes: [SQLite](SQLite.html)\
\

Alter table {.heading-level2}
-----------

官方文档上一次只能增加一个column，不能一次添加多个column（[http://stackoverflow.com/questions/6172815/sqlite-alter-table-add-multiple-columns-in-a-single-statement）](http://stackoverflow.com/questions/6172815/sqlite-alter-table-add-multiple-columns-in-a-single-statement）)\
 \
 "Alter table speeddial add column1 text, column2 integer;" Wrong \
 "Alter table speeddial add column1 text;" Right\
 \
 \
 Drop column\
 \
 alter table icecream drop column flavor; \
 This removes the column "flavor" from the table called "icecream".\

