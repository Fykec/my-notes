parent nodes: [Error handling](Error%20handling.html)\
\

New package not yet registered with the system Waiting 3 sec {.heading-level2}
------------------------------------------------------------

\
 Posts: 1352 \
 \
 I like...\
 \
 posted Monday, August 16, 2010 13:24:15 \
 I generally get that error when I delete the application manually from
adb shell prompt and then install it via Eclipse. I think the problem is
that the application does not get properly installed. I mean maybe it
gets copied to /data/app but is not registered with the
application(probably some list that PackageManager maintains). It is an
ADT bug, IMO. \
 \
 To get around this, I change something in the source file(add spaces
and save) and then deploy the application on the emulator and it works.
If this doesn't help, try one or all of following: \
 1. exiting eclipse \
 2. killing and restarting adb \
 3. closing the emulator.\
 \
 \
 Posts: 536 \
 \
 I like...\
 \
 posted Monday, August 16, 2010 13:24:23 \
 Try this Project-\>Clean in eclipse, and the deploy it again.
