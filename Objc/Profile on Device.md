parent nodes: [ObjC](ObjC.html)\
\

Profile on Device {.heading-level2}
-----------------

​1. start xcode\
 2. strat Instruments (proflie)\
 3. connect device like iphone\
 4. use xcode build and run on device\
 5. profile select target to stop the running app\
 6. use profile to restart app(now ok)\
 \
 Same problem - it worked the first two times, then after that never
again (even after restarting Xcode, deleiting the device, etc).\
 \
 Eventually I resorted to:\
 \
 Set [XCode](XCode.html) to display the Console\
 Run with Performance Tool (instruments starts, and goes "BEEP" with no
error - Apple "forgot" to include the error message, I think. ARGH!)\
 Build&Run on device\
 Once the (gdb) appears in console, go to Instruments and select "Attach
to Process" from the drop-down at top\
 If you cannot see the name of your debugging app, wait a second, and
try again\
 Eventually your app appears in the list of alread-running stuff, so
select it\
 Hit the Record button\
 \

[http://stackoverflow.com/questions/1358115/unable-to-run-instruments-on-my-iphone-app-on-the-device](http://stackoverflow.com/questions/1358115/unable-to-run-instruments-on-my-iphone-app-on-the-device)
