parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Android 不同屏幕大小 {.heading-level2}
--------------------

关于Android的nodpi,xhdpi,hdpi,mdpi,ldpi\
 作者：lizongbo 发表于：22:43. 星期三, 一月 12th, 2011\

版权声明：可以任意转载，转载时请务必以超链接形式标明文章原始出处和作者信息及本版权声明。\

[http://618119.com/archives/2011/01/12/205.html](http://618119.com/archives/2011/01/12/205.html)\
 \
 关于Android的nodpi,xhdpi,hdpi,mdpi,ldpi\
 \
 首先是几个基本概念：\
 1.屏幕尺寸Screen size\
 即显示屏幕的实际大小，按照屏幕的对角线进行测量。\

为简单起见，Android把所有的屏幕大小分为四种尺寸：小，普通，大，超大(分别对应：small,
normal, large, and extra large).\

应用程序可以为这四种尺寸分别提供不同的自定义屏幕布局-平台将根据屏幕实际尺寸选择对应布局进行渲染，这种选择对于程序侧是透明的。\
 \
 2.屏幕长宽比Aspect ratio\

长宽比是屏幕的物理宽度与物理高度的比例关系。应用程序可以通过使用限定的资源来为指定的长宽比提供屏幕布局资源。\
 3.屏幕分辨率Resolution\

在屏幕上显示的物理像素总和。需要注意的是：尽管分辨率通常用宽x高表示，但分辨率并不意味着具体的屏幕长宽比。\
 在Andorid系统中，应用程序不直接使用分辨率。\
 \
 4.密度Density\
 根据像素分辨率，在屏幕指定物理宽高范围内能显示的像素数量。\

在同样的宽高区域，低密度的显示屏能显示的像素较少，而高密度的显示屏则能显示更多的像素。\

屏幕密度非常重要，因为其它条件不变的情况下，一共宽高固定的UI组件（比如一个按钮）在在低密度的显示屏上显得很大，
而在高密度显示屏上看起来就很小。\

为简单起见，Android把所有的屏幕分辨率也分为四种尺寸：小，普通，大，超大(分别对应：small,
normal, large, and extra large).\

应用程序可以为这四种尺寸分别提供不同的资源-平台将透明的对资源进行缩放以适配指定的屏幕分辨率。\
 \
 5.设备独立像素Density-independent pixel (dp)\

应用程序可以用来定义UI组件的虚拟像素单元，通过密度无关的方式来描述布局尺寸和位置。\
 一个设备独立像素相当于一个160 dpi屏幕上的物理像素。\

在程序运行时，系统根据屏幕的实际密度透明的处理任何需要缩放的设备独立像素单元，设备独立像素转换成屏幕实际像素的换算很简单：pixels
= dps \* (density / 160).\
 例如在240
dpi的屏幕上，1个设备独立像素等于1.5物理像素.为确保UI组件在不同的屏幕都能合适的展示，强烈建议使用设备独立像素单元来定义你的应用程序UI。\
 \
 四种屏幕尺寸分类：: small, normal, large, and xlarge\
 四种密度分类: ldpi (low), mdpi (medium), hdpi (high), and xhdpi (extra
high)\
 需要注意的是: xhdpi是从 Android 2.2 (API Level 8)才开始增加的分类.\
 xlarge是从Android 2.3 (API Level 9)才开始增加的分类.\
 DPI是“dot per inch”的缩写，每英寸像素数。\
 \
 一般情况下的普通屏幕：ldpi是120，mdpi是160，hdpi是240，xhdpi是320。\
 \

参考：![](http://developer.android.com/images/screens_support/screens-ranges.png)\
 \
 两种获取屏幕分辨率信息的方法：\
 \
 DisplayMetrics metrics = new DisplayMetrics();\
 Display display = activity.getWindowManager().getDefaultDisplay();\
 display.getMetrics(metrics);\
 //这里得到的像素值是设备独立像素dp\
 \
 //DisplayMetrics metrics=activity.getResources().getDisplayMetrics();
这样获得的参数信息不正确，不要使用这种方式。\

不能使用android.content.res.Resources.getSystem().getDisplayMetrics()。这个得到的宽和高是空的。\
 如果需要为Android pad定制资源文件，则res目录下的目录可能为：\
 drawable\
 drawable-ldpi\
 drawable-mdpi\
 drawable-hdpi\
 drawable-xhdpi\
 drawable-nodpi\
 drawable-nodpi-1024×600\
 drawable-nodpi-1280×800\
 drawable-nodpi-800×480\
 values\
 values-ldpi\
 values-mdpi\
 values-hdpi\
 values-xhdpi\
 values-nodpi\
 values-nodpi-1024×600\
 values-nodpi-1280×800\
 values-nodpi-800×480\
 \
 参考：\
 \

[http://developer.android.com/guide/practices/screens\_support.html](http://developer.android.com/guide/practices/screens_support.html)
