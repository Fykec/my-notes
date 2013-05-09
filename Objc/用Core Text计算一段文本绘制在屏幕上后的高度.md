parent nodes: [ObjC](ObjC.html)\
\

用Core Text计算一段文本绘制在屏幕上后的高度 {.heading-level2}
-------------------------------------------

[http://www.cocoachina.com/iphonedev/sdk/2010/0719/1889.html](http://www.cocoachina.com/iphonedev/sdk/2010/0719/1889.html)\
 \
 \
 Core
Text提供了一系列方便的函数，可以很容易的把文本绘制在屏幕上，对于一个Frame来说，一般并不需要担心文本的排列问题，这些Core
Text的函数都可以直接搞定，只要给他一个大小合适的CGRect就可以。\
 \

但，在某些情况下，我们还希望知道这段文本在绘制之后，对应绘制的字体字号设置，在屏幕上实际占用了多大面积。举例来说，有文本段落a，屏幕大小
rect，通常做法是以rect创建path，然后创建CTFramesetter，再然后创建CTFrame，最后用CTFrameDraw画出来，这
时候，往往文本段落占用的实际面积会小于rect，这时候就有必要获得这段文本所占用的真正面积。\
 \
 最理想的情况是使用\
 \
 double CTLineGetTypographicBounds( CTLineRef line, CGFloat\* ascent,
CGFloat\* descent, CGFloat\* leading );\
 \
 这是Core
Text提供的函数，传入CTLine，就会得到这一行的ascent,descent和leading，在OSX上通常可以工作的很好，但是在
iOS(iPhone/iPad)上这个函数的结果略有不同。\
 \

正常情况下，计算行高只需要ascent+descent+leading即可。在这个略有不同的情况下，leading的值会出现偏差，导致算出
来的结果是错误的。如果不管行距，ascent+descent计算出来的Glyph的高度还是正确的。\
 \
 这样就有了第一步\
 \

在创建用于绘图的CFAttributedStringRef时，除了设置字体，多设置一个CTParagraphStyleRef，其中特别应该
确定行距kCTParagraphStyleSpecifierLineSpacing。在计算这里时，先逐行计算ascent+descent，累加起
来，再加上一个行数\*之前设置好的行距，这样算出来的就是这些文本的实际高度，CTLineGetTypographicBounds返回的结果是宽度，
这样就可得到文本实际填充面积的Rect了。\
 \

但是这还是有问题，因为OSX上和iOS处理不同，所以事实上iOS的模拟器和真机的最终效果是不一样的，这样调试程序很麻烦。\
 于是还需要第二步\
 \

在最终往页面上绘制的时候，不再用CTFrameDraw来一次绘制全部，而是使用CTLineDraw逐行画，在画之前，先用
CGContextSetTextPosition来设置好每行文本的位置。这样就保证了在任何平台上绘制效果一致。\
 \
 问题就解决了。\
 \
 CoreText在OS
X和iOS上实现有很多细节区别，比如说，对CTRun的划分方式也不一样，在iOS上划分出来的Run数量比OSX上少很多，是按照字体划分的Run，
按照文档出来，这是正确的，但OSX上是一个字一个Run这样划分的，和文档不符。iOS上的处理显然效率更好。\
 \
 stackoverflow 上有一个类 似的讨论，不过没考虑到iOS的区别\
 \
 本文转自 霍炬的网络日志，原文
[http://blog.devep.net/virushuo/2010/07/17/cocoa-core-text-text-height.html，转载时请以链接方式著名作者以及原文地址。](http://blog.devep.net/virushuo/2010/07/17/cocoa-core-text-text-height.html，转载时请以链接方式著名作者以及原文地址。)
