parent nodes: [ObjC](ObjC.html)\
\
 /****

(void)drawGradientColor:(CGContextRef)context {.heading-level1}
=============================================

startColor:(UIColor**)startColor**

{\
 CGContextSaveGState(context);//because need clip rect, so need save and
restore\
 CGContextClipToRect(context, clipRect);\
 \
 UIColor colors [2] = {startColor,endColor};

CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();\
 CGFloat colorComponents[8]; \
 \
 for (int i = 0; i \< 2; i++) {

UIColor **color = colors[i]; \
 CGColorRef temcolorRef = color.CGColor;\
 \
 const CGFloat**components = CGColorGetComponents(temcolorRef); \
 for (int j = 0; j \< 4; j++) {

}

} \
 \
 CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb,
colorComponents, NULL, 2); \
 \
 CGColorSpaceRelease(rgb);\
 CGContextDrawLinearGradient(context, gradient, startPoint, endPoint,
options);\
 CGGradientRelease(gradient);\
 \
 CGContextRestoreGState(context);

}
