parent nodes: [ObjC](ObjC.html)\
\

i OS 怎样从图片中截取出需要的部分 {.heading-level2}
---------------------------------

/****\
 **从图片中按指定的位置大小截取图片的一部分\
** UIImage image 原始的图片\
 \* CGRect rect 要截取的区域\
 **/\
 - (UIImage**)imageFromImage:(UIImage **)image inRect:(CGRect)rect { \
 CGImageRef sourceImageRef = [image CGImage]; \
 CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef,
rect); \
 UIImage**newImage = [UIImage imageWithCGImage:newImageRef]; \
 return newImage; \
 } \
 \

[http://wangsheng2008love.blog.163.com/blog/static/782016892012717515767/](http://wangsheng2008love.blog.163.com/blog/static/782016892012717515767/)
