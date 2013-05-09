parent nodes: [ObjC](ObjC.html)\
\

Pretty Log {.heading-level2}
----------

\#if define DEBUG\
 \
 \#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt),
*\_PRETTT\_FUNCTION\_*, *\_LINE\_*, \#\#*\_VA\_ARGS\_*);\
 \#else\
 \#define DLog(...)\
 \#endifs
