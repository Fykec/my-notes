parent nodes: [ObjC](ObjC.html)\
\

Get A Use Ful Stack {.heading-level2}
-------------------

Getting a useful stack trace from NSException\#callStackReturnAddresses\
 Its always been a little painful when you get an exception and the
debugger decides not to cooperate, leaving you with something like:\
 \
 \
 \
 Thanks!\
 \
 As far as I could work out, traditional methods of grabbing a symbolic
stack trace don’t work on the iPhone. (If I am remembering right, I
don’t think NSStackTraceKey exists in UIKit.)\
 \
 A little while ago I hacked the GTMStackTrace from
google-toolbox-for-mac, to lookup the symbolic stack trace from the call
stack return addresses (NSException\#callStackReturnAddresses introduced
in 10.5) and print it out using NSSetUncaughtExceptionHandler. Life has
been a little bit easier ever since. Thankfully, the awesome people who
work on GTM added it in themselves (see GTMStackTrace.h\#61). Here is
how you might set it up, in main.m:\
 \
 \#ifdef DEBUG\
 \#import \<Foundation/NSDebug.h\>\
 \#import "GTMStackTrace.h"\
 \
 void exceptionHandler(NSException **exception) {**

}\
 \#endif\
 \
 int main(int argc, char argv[]) {\
 \
 \#ifdef DEBUG

\#endif \

}\
 view rawgistfile1.mThis Gist brought to you by GitHub.\
 For me, DEBUG is set in GCC\_PREPROCESSOR\_DEFINITIONS via the awesome
GTM xcconfg files, which you should also be using. Hopefully, you should
get a trace that looks like:\
 \
 [Session started at 2008-12-30 00:10:13 -0800.]\
 2008-12-30 00:10:15.772 TestExceptionIPhone[8493: 20b] Debug enabled\
 2008-12-30 00:10:15.830 TestExceptionIPhone[8493: 20b] \#0 0x92c5614b
\_NSExceptionSetRubyToken()
(/System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation)\
 \#1 0x9657ce3b objc\_exception\_throw() (/usr/lib/libobjc.A.dylib)\
 \#2 0x92c55f2b +[NSException raise:format:arguments:]
(/System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation)\
 \#3 0x92c55f6a +[NSException raise:format:]
(/System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation)\
 \#4 0x002350 +[TestExceptionIPhoneAppDelegate
applicationDidFinishLaunching:] (/Users/gabe/Library/Application
Support/iPhone
Simulator/User/Applications/586E48B6-B758-4DBD-A534-D6927DA74583/TestExceptionIPhone.app/TestExceptionIPhone)\
 \#5 0x30a4e01a +[UIApplication performInitializationWithURL:asPanel:]
(/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator2.2.sdk/System/Library/Frameworks/UIKit.framework/UIKit)\
 \#6 0x30a57363 +[UIApplication \_runWithURL:]
(/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator2.2.sdk/System/Library/Frameworks/UIKit.framework/UIKit)\
 \#7 0x900425ee +[NSRunLoop runMode:beforeDate:]
(/System/Library/Frameworks/Foundation.framework/Versions/C/Foundation)\
 \#8 0x92bdcb45 CFRunLoopRunSpecific()
(/System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation)\
 \#9 0x92bdccf8 CFRunLoopRunInMode()
(/System/Library/Frameworks/CoreFoundation.framework/Versions/A/CoreFoundation)\
 \#10 0x31564600 GSEventRunModal()
(/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator2.2.sdk/System/Library/PrivateFrameworks/GraphicsServices.framework/GraphicsServices)\
 \#11 0x315646c5 GSEventRun()
(/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator2.2.sdk/System/Library/PrivateFrameworks/GraphicsServices.framework/GraphicsServices)\
 \#12 0x30a4ec98 +[UIApplication \_run]
(/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator2.2.sdk/System/Library/Frameworks/UIKit.framework/UIKit)\
 \#13 0x30a5a094 UIApplicationMain()
(/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator2.2.sdk/System/Library/Frameworks/UIKit.framework/UIKit)\
 2008-12-30 00:10:15.834 TestExceptionIPhone[8493: 20b] ****\*
Terminating app due to uncaught exception 'NSInvalidArgumentException',
reason: 'Give me a good stack trace'\
 view rawgistfile1.txtThis Gist brought to you by GitHub.
