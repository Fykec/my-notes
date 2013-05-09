parent nodes: [ObjC](ObjC.html)\
\

Better screen shot {.heading-level2}
------------------

(UIImage**)imageFromView:(UIView**)view withHighQuality:(BOOL)highQuality{ {.heading-level1}
==========================================================================

}\
 \

(UIImage**)imageFromView:(UIView**)view withBounds:(CGRect)bounds withHighQuality:(BOOL)highQuality{ {.heading-level1}
====================================================================================================

UIGraphicsBeginImageContext(bounds.size);\
 CGContextRef context = UIGraphicsGetCurrentContext();\
 if (!highQuality) {

}\
 [view.layer renderInContext:UIGraphicsGetCurrentContext()];\
 UIImage\* screenshot = UIGraphicsGetImageFromCurrentImageContext();\
 UIGraphicsEndImageContext();\
 return screenshot;

}\
 \
 \
 CGSize imageSize = CGSizeMake(self.bounds.size.width -
IMAGE\_VIEW\_MARGIN \* 2, PREVIEW\_HEIGHT - IMAGE\_VIEW\_MARGIN \* 2);

imageSize = CGSizeMake(imageSize.width \* 2, imageSize.height \*
2);//For new ipad @2x resolution\
 //!!!!!!!Notice need multiple by 2\
 if (imageSize.width != 0)\
 {

}\
 \

//\
 // UIImage+Scale.m\
 // Core\
 //\
 // Created by qluo on 11/9/12.\
 //\
 //\
 \
 \#import "UIImage+Scale.h"\
 \
 @implementation UIImage (Scale)\
 \
 //截取部分图像 \
 -(UIImage**)getSubImage:(CGRect)rect\
 {**

}\
 \
 //缩放\
 -(UIImage)scaleToSize:(CGSize)size\
 {

// 创建一个bitmap的context\
 // 并把它设置成为当前正在使用的context\
 if (size.width \> 0 && size.height \> 0)\
 {

}\
 else\
 {

}

}\
 \
 //等比例缩放, 并且取其中的一部分\
 -(UIImage**)scaleClipToSize:(CGSize)size\
 {**

// 创建一个bitmap的context\
 // 并把它设置成为当前正在使用的context\
 if (size.width \> 0 && size.height \> 0 && (self.size.width != 0))\
 {

}\
 else\
 {

}

}\
 \
 //等比例缩放, 并且取其中的一部分\
 -(UIImage)clipToSize:(CGSize)size\
 {

if (size.width \> 0 && size.height \> 0)\
 {

}\
 else\
 {

}\

}\
 \
 @end\

