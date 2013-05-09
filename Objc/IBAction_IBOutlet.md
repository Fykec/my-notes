parent nodes: [ObjC](ObjC.html)\
\

IB Action\_IB Outlet {.heading-level2}
--------------------

Apress - Learn Cocoa on the Mac (Feb 2010) (ATTiCA)\
 You might be wondering just what IBAction and IBOutlet are. Are they
part of the Objective-C language?\
 Nope. They're good old-fashioned C pre-processor macros. If you go into
the AppKit.framework and look at the NSNibDeclarations.h header file,
you'll see that they're defined like this:\
 \
 \#ifndef IBOutlet \
 \#define IBOutlet \
 \#endif\
 \
 \#ifndef IBAction \
 \#define IBAction void \
 \#endif\
 \
 Confused? These two keywords do absolutely nothing as far as the
compiler is concerned. IBOutlet gets entirely removed from the code
before the compiler ever sees it. IBAction resolves to a void return
type, which just means that action methods do not return a value. So,
what's going on here?\
 The answer is simple, really: IBOutlet and IBAction are not used by the
compiler. They are used by Interface Builder. Interface Builder uses
these keywords to parse out the outlets and actions available to it.
Interface Builder can only see methods that are prefaced with IBAction
and can only see variables or properties that are prefaced with
IBOutlet. Also, the presence of these keywords tells other programmers,
looking at your code in the future, that the variables and methods in
question aren't dealt with entirely in code. They'll need to delve into
the relevant nib file to see how things are hooked up and used.\

