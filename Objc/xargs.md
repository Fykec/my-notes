parent nodes: [ObjC](ObjC.html)\
\

xargs {.heading-level2}
-----

\
 1. xargs: Problems with Spaces and Newlines\
 \

[http://linuxdevcenter.com/pub/a/linux/lpt/09\_22.html](http://linuxdevcenter.com/pub/a/linux/lpt/09_22.html)\
 \
 The GNU xargs (used on Linux) has a -0 (zero) option; this means the
pathnames it reads are separated by NUL characters instead of
whitespace. GNU's find (also used by Linux) has a -print0 operator that
puts a NUL between pathnames instead of a newline. Use them together
like this:\
 \
 \
 \
 % find . -type f -mtime +7 -print0 | xargs -0 rm\
 \
 \
 2. file name too long\
 \

