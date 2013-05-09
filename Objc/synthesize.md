parent nodes: [ObjC](ObjC.html)\
\

synthesize {.heading-level2}
----------

\
 in super class\
 @implementation SubMainShareViewController\
 \
 @synthesize shareModel = \_shareModel;\
 -(void)setShareModel:(id)value\
 {

}\
 \
 \
 in sub class\
 @implementation BoxMainShareViewController\
 @synthesize shareModel;\
 \
 if we don't put in sub class\
 -(void)setShareModel:(id)value\
 {

}\
 \
 the sub class will have default implement\
 \
 -(void)setShareModel:(id)value\
 {

}\
 so this default implementaion will never call super class
