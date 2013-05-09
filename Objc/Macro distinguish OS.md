parent nodes: [ObjC](ObjC.html)\
\

Macro distinguish OS {.heading-level2}
--------------------

[http://stackoverflow.com/questions/5919996/how-to-detect-reliably-mac-os-x-ios-linux-windows-in-c-preprocessor](http://stackoverflow.com/questions/5919996/how-to-detect-reliably-mac-os-x-ios-linux-windows-in-c-preprocessor)\
 \
 \#ifdef *WIN64*

\#elif \_WIN32

\#elif \_\_APPLE\_

\#include "TargetConditionals.h"\
 \#ifdef TARGET\_OS\_IPHONE

\#elif TARGET\_IPHONE\_SIMULATOR

\#elif TARGET\_OS\_MAC

\#else

\#endif

\#elif \_\_linux

\#elif \_\_unix // all unices not caught above

\#elif \_\_posix

\#endif
