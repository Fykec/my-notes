parent nodes: [ObjC](ObjC.html) |
[VerticallyAlignedLabel](VerticallyAlignedLabel.html)\
\

Vertically Aligned Label {.heading-level2}
------------------------

//\
 // [VerticallyAlignedLabel](VerticallyAlignedLabel.html).h\
 //\
 \
 \#import \<Foundation/Foundation.h\>\
 \
 \
 typedef enum VerticalAlignment {

} VerticalAlignment;\
 \
 @interface [VerticallyAlignedLabel](VerticallyAlignedLabel.html) :
UILabel {\
 @private

}\
 \
 @property (nonatomic, assign) VerticalAlignment verticalAlignment;\
 \
 @end\
 \
 \
 //\
 // [VerticallyAlignedLabel](VerticallyAlignedLabel.html).m\
 //\
 \
 \#import "[VerticallyAlignedLabel](VerticallyAlignedLabel.html).h"\
 \
 \
 @implementation [VerticallyAlignedLabel](VerticallyAlignedLabel.html)\
 \
 @synthesize verticalAlignment = verticalAlignment\_;\
 \
 - (id)initWithFrame:(CGRect)frame {

if (self = [super initWithFrame:frame]) {

}\
 return self;

}\
 \
 - (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment {

}\
 \
 - (CGRect)textRectForBounds:(CGRect)bounds
limitedToNumberOfLines:(NSInteger)numberOfLines {

CGRect textRect = [super textRectForBounds:bounds
limitedToNumberOfLines:numberOfLines];\
 switch (self.verticalAlignment) {

case VerticalAlignmentTop:

case VerticalAlignmentBottom:

case VerticalAlignmentMiddle:

default:

}\
 return textRect;

}\
 \
 -(void)drawTextInRect:(CGRect)requestedRect {

}\
 \
 @end
