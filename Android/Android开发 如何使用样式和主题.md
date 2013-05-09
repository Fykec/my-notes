parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Android开发 如何使用样式和主题 {.heading-level2}
------------------------------

\

样式是用于描述一个View或是一个窗口的显示属性的集合，样式可以指定如高度，填充，字体颜色，字体大小，背景颜色等属性。样式是从布局文件中分离出来的一个XML资源文件。Android中的样式就像Web开发中的css样式表，它使用我们的样式独立于内容进行设计开发。\
 例如，通过使用一个样式可以让如下的布局文件\
 \
 \<TextView

简化为：\
 \
 \<TextView

所有和样式有关的属性都被从布局XML文件中移动到一个叫“CodeFont”的样式定义中，然后使用一个style属性指定样式名称。你将会在以下的内容中看到如何定义一个样式。\
 \

应用于一个Activity或应用程序的样式称为主题（theme）,而不是刚才说的一个View。所有在当前Activity或应用下的视图（VIEW）都会应用相同的主题样式。例如，您可以让一个Activity使用”CodeFont”主题，那么这个Activity下的所有视图的的文本都将是绿色等宽字体。\
 \
 定义样式\
 \
 定义样式我们需要在
res/values/目录下新建一个XML文件，文件名自已随便命名，但必须以.xml为文件后缀。Xml的根节点必须为。\
 我们用style标签来定义一个样式，用标签来定义样式属性。如下所示：\
 \
 \<?xml version="1.0" encoding="utf-8"?\>\

\

Style标签的name属性是必须有的，节点可以定义颜色、高度或者是另一个资源的引用。所有节点的子节点在编译时都会做为应用程序的一个资源。所以我们可以通过style节点的name属性值来引用这个资源。比如在布局文件中使用@style/CodeFont来引用这个样式。parent
属性是可选的，用它来标识本样式是继承哪个样式，在父样式中的所有属性都将被应用于本样式中，同时可以覆盖父样式中的样式（和java的继承相似）。\
 \
 样式的继承\

这里有两种方式可以实现样式继承，如上例中所示的，我们可以在定义样式时使用parent属性来继承样式，使用这种方式，我们可以继承一个我们自己定义好的样式，也可以继承一个android平台自带的样式(后文中会介绍android平台自带的所有样式)。如下所示，我们继承一个android平台默认的文本样式，并把它的字体颜色改为我们需要的颜色。\
 \

另一种继承的方式是使用用户自定义的样式作为前缀即可。这种方式只适用于继承用户自定义样式。如下所示：\
 \

\

这样，新定义的样式就会继承CodeFont样式的所有属性，然后把字体颜色变为\#FF0000。我们可以这样引用新的样式：
@style/CodeFont.Red\
 相同的方法，我们可以再继承下去，如下所示：\
 \

\
 这样新的样式文子的大小就和CodeFont.Red样式不同了。\
 \
 样式属性\
 \

到这里为止，你已经知道了如何定义一个样式，你还需要知道有多少种样式属性可以通过节点来定义。你可能已经对其中的一些比较熟悉了，如layout\_width
、textColor等。当然，还有很多的样式属性是你可以使用的。\
 \
 最好的方法查询一个视图支持哪些样式属性的方法是查询视图类的文档中XML
Attributes表格，如TextView的XML attributes如链接中所示：
[http://www.ideasandroid.com/android/sdk/docs/reference/android/widget/TextView.html\#lattrs](http://www.ideasandroid.com/android/sdk/docs/reference/android/widget/TextView.html#lattrs)\
 \
 如需所有可用的样式属性的，请参阅R.attr：
[http://www.ideasandroid.com/android/sdk/docs/reference/android/R.attr.html](http://www.ideasandroid.com/android/sdk/docs/reference/android/R.attr.html)\

不是所有的视图都支持上面的样式属性，如果遇到不支持的样式属性，您定义的属性将会被忽略。\
 \
 应用样式和主题\
 \

应用样式和主题的方法很简单，在布局定义文件（layout）中，使用style属性直接引用样式资源，如下所示：\
 \
 \<TextView

在AndroidManifest.xml文件中可以引用样式主题，可以为一个Activity定义一个主题，也可以为整个应用程序定义一个主题，如下所示：\
 \
 \
 或者：\
 \
 \
 Android平台的样式和主题\
 \

样式见：[http://www.ideasandroid.com/android/sdk/styles.xml](http://www.ideasandroid.com/android/sdk/styles.xml)\

主题见：[http://www.ideasandroid.com/android/sdk/themes.xml](http://www.ideasandroid.com/android/sdk/themes.xml)
