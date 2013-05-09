parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Android button 特效 selector + shape {.heading-level2}
------------------------------------

当然除了使用drawable这样的图片外今天谈下自定义图形shape的方法，对于Button控件Android上支持以下几种属性shape、gradient、stroke、corners等。

Java代码 \

\<gradient

\<stroke

\<corners

\<padding

对于上面，这条shape的定义，分别为渐变，在gradient中startColor属性为开始的颜色，endColor为渐变结束的颜色，下面的angle是角度。接下来是stroke可以理解为边缘，corners为拐角这里radius属性为半径，最后是相对位置属性padding。

Java代码 \
 \<?xml version="1.0" encoding="utf-8"?\> \
 \<selector

xmlns:android="[http://www.norkoo.com](http://www.norkoo.com)"\> \

\<gradient

\<stroke

\<corners

\<padding

\
 \

\<gradient

\<stroke

\<corners

\<padding

\
 \

\<gradient

\<stroke

\<corners

\<padding

\
 \

注意！提示大家，以上几个item的区别主要是体现在state\_pressed按下或state\_focused获得焦点时，当当来判断显示什么类型，而没有state\_xxx属性的item可以看作是常规状态下。\
 \
 \<?xml version="1.0" encoding="utf-8"?\>

\<item

\

Elements：\
 \
 必须。必须是根元素。包含一个或多个元素。

Attributes：

xmlns:android

定义特定状态的color，通过它的特性指定。必须是的子元素。\
 Attributes：

android:color

l \#RGB\
 l \#ARGB\
 l \#RRGGBB\
 l \#AARRGGBB

Boolean。“true”表示按下状态使用（例如按钮按下）；“false”表示非按下状态使用。

Boolean。“true”表示聚焦状态使用（例如使用滚动球/D-pad聚焦Button）；“false”表示非聚焦状态使用。

Boolean。“true”表示选中状态使用（例如Tab打开）；“false”表示非选中状态使用。

Boolean。“true”表示可勾选状态时使用；“false”表示非可勾选状态使用。（只对能切换可勾选—非可勾选的构件有用。）

android:state\_checked

android:state\_enabled

Boolean。“true”表示可用状态使用（能接收触摸/点击事件）；“false”表示不可用状态使用。

Boolean。“true”表示应用程序窗口有焦点时使用（应用程序在前台）；“false”表示无焦点时使用（例如Notification栏拉下或对话框显示）。\

注意：记住一点，StateList中第一个匹配当前状态的item会被使用。因此，如果第一个item没有任何状态特性的话，那么它将每次都被使用，这也是为什么默认的值必须总是在最后（如下面的例子所示）。\
 \
 Examples：\
 XML文件保存在res/color/button\_text.xml\
 \<?xml version="1.0" encoding="utf-8"?\>\

\<item android:state\_pressed="true"

\<item android:state\_focused="true"

\<!-- default --\>

\

\<Button

来源（一）：[http://www.norkoo.com/show/Mobile\_Technology/android/haihkhjijkijajkihgcdkiibkbcee.aspx](http://www.norkoo.com/show/Mobile_Technology/android/haihkhjijkijajkihgcdkiibkbcee.aspx)\
 来源（二）：\

[http://www.cnblogs.com/xirihanlin/archive/2010/06/11/1756121.html](http://www.cnblogs.com/xirihanlin/archive/2010/06/11/1756121.html)
