parent nodes: [ObjC](ObjC.html)\
\

NS Rect to CG Rect {.heading-level2}
------------------

NSRectToCGRect\
 \
 last edited July 21, 2008 23:05:50 (203.8.112.3)\
 CocoaDev is sponsored by: Panic: Shockingly good Mac software!\
 Edit / History / New / Search Quick Links: Home / Recent Changes /
Glossary / Jobs / Forums / Help\
 HowToConvert\
 \
 Hi,\
 \
 is there some convenience method somewhere to turn an NSRect into a
CGRect (CoreGraphics)?\
 \
 Thanks for any pointers.\
 \
 From Mac OS X 10.5 (Leopard) onwards, Apple provide an inline function
to do this:\

as well as the matching function:\

Apple's documentation talks about this
([http://developer.apple.com/releasenotes/Cocoa/AppKitOlderNotes.html](http://developer.apple.com/releasenotes/Cocoa/AppKitOlderNotes.html))\

--zootbobbalu\
 \
 1. Potentially dangerous typecast (Method, that is used in Apple CG
examples):\

Aside from being dangerous if the definition of NSRect or CGRect
changes, this method is dangerous because it can cause bugs due to "type
punning" (see
[http://en.wikipedia.org/wiki/Type\_punning](http://en.wikipedia.org/wiki/Type_punning)).
A safer approach would use a "union" (see below).\
 \
 2. Inline function:\

static inline CGRect NSRectToCGRect(NSRect nsRect)\
 {

cgRect.origin.x = nsRect.origin.x;\
 cgRect.origin.y = nsRect.origin.y;\
 cgRect.size.width = nsRect.size.width;\
 cgRect.size.height = nsRect.size.height;\
 \
 return cgRect;\
 }\

​3. Macro:\

​4. An alternate, union-based macro.\

This union uses a GCC approved safe type pun through a union. See here:
[http://gcc.gnu.org/onlinedocs/gcc-4.1.1/gcc/Optimize-Options.html\#index-fstrict\_002daliasing-542](http://gcc.gnu.org/onlinedocs/gcc-4.1.1/gcc/Optimize-Options.html#index-fstrict_002daliasing-542)\
 \
 -- JP\
 \
 -- Point 4 and Point 1 comments by MG\
 \
 Why not an inline function like :\

static inline CGRect NSRectToCGRect(NSRect nsRect)\
 {

}\

-- DB\
 \
 Wow, that's fantastic, thanks!\
 \
 I suppose the only way to turn an NSBezierPath to a CG path is to go
the inline function route and contruct a new cg path to return point by
point from the points in the BezierPath??\
 \
 But thanks for this, it's great.\
 \
 Note: Core Graphics already has an inline CGRectMake. That being said,
NSRect, HIRect? and CGRect all carry the same definition (HIRect? is
just a typedef of CGRect).\
 \
 To answer your question, NSBezierPath is NOT bridged to a CG, So yes
you would need to create and build a new CGMutablePathRef?, or just use
CGPathRef?'s to begin with.\
 \
 There is a more usable, though perhaps less portable, way. Assuming
Apple will eventually merge these types, this just plans for the future.
In a precompiled header, or in any case before importing any foundation
headers, include these three \#define lines:\

The dummy functions are inline so they can be in a CodeWarrior
precompiled header, but that may not work with strict C. I also wrapped
the whole precompiled header in some \#pragmas so I can keep unused
variable warnings:\

I avoid Xcode like the plague, but if you must use it there may be
similar \#pragmas and \#defines to accomplish the same thing.\
 \
 Once these \#defines are in place an NSRect is a typedef of CGRect so
you can use them interchangeably. Just remember to convert for
coordinate systems and the like. The benefit of this ugly code is that
you do not have to edit NSGeometry.h directly.\
 \
 Enjoy\
 \
 Eric Cole\
 Edit / History / New / Search Quick Links: Home / Recent Changes /
Glossary / Jobs / Forums / Help\

