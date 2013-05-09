parent nodes: [Error handling](Error%20handling.html) |
[SQLiteClosable](SQLiteClosable.html)\
\

attempt to acquire a reference on a close [SQLiteClosable](SQLiteClosable.html) {.heading-level2}
-------------------------------------------------------------------------------

I posted this back in May on the [android-developers] Google Group. I
never heard back and was not able to reproduce the problem until one of
my students did last week. I figured I'd post it here and see if it rang
any bells for anyone.\
 \
 In one of my code samples, I have the following method:\
 \
 static Cursor getAll(SQLiteDatabase db, String orderBy) {
return(db.rawQuery("SELECT \* FROM restaurants "+orderBy, null)); } When
I run it, sporadically, I get this:\
 \
 java.lang.IllegalStateException: attempt to acquire a reference on a
close [SQLiteClosable](SQLiteClosable.html)

Answer:\
 \
 accepted This one drove me insane for the longest time. The solution I
have found is fairly simple: don't keep references to SQLiteDatabase
objects. Instead, use a SQLiteOpenHelper and call getWritableDatabase()
every time you need one. From the docs:\
 \
 public synchronized SQLiteDatabase getWritableDatabase()\
 \
 Create and/or open a database that will be used for reading and
writing. Once opened successfully, the database is cached, so you can
call this method every time you need to write to the database.\
 \
 The answer was right there the whole time.\

