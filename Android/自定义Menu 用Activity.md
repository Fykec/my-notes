parent nodes: [Android Menu](Android%20Menu.html)\
\

自定义Menu 用Activity {.heading-level2}
---------------------

用activity实现半透明的、淡入的menu—供初学者研究学习\
 \
 虽然android带的menu已经很漂亮，但有的时候也需要我们去自定义menu。\
 \

开始的时候只是想在android上做一个半透明的menu，但是刚刚接触android不是太久，我不知道从何处入手，也不知道如何修改android自带的menu，于是到网上找，结果找了好久有关半透明的menu，都没有找到，只好静下心来研究文档和相关书籍，最后用activity制作出半透明的menu，而且在menu弹出的时候加入了一个淡入的动画。如下图所示：\
 \
 \
 \
 1、首先创建一个工程，命名为translucentButton\
 \
 2、创建menu layout\
 \

想创建什么样式的menu，layout很重要，在layout中，没有用到什么特别的语法，在基础类书籍当中都能查的到，稍微难一点的就是Button上的selector。源码如下：\
 \
 1\
 2\
 3\
 4\
 5\
 6\
 7\
 8\
 9\
 10\
 11\
 12\
 13\
 14\
 15\
 16\
 17\
 18\
 19\
 20\
 21\
 22\
 23\
 24\
 25\
 26\
 27\
 28\
 29\
 30\
 31\
 32\
 33\
 34\
 35\
 36\
 37\
 38\
 39\
 40\
 41\
 42\
 43\
 44\
 45\
 46\
 47\
 48\
 49\
 50\
 \<?xml version="1.0" encoding="utf-8"?\>\
 \
 \<LinearLayout
xmlns:android="[http://schemas.android.com/apk/res/android](http://schemas.android.com/apk/res/android)"

android:orientation="vertical"\
 android:layout\_width="fill\_parent"\
 android:layout\_height="fill\_parent"\
 android:gravity="bottom"\>

\<LinearLayout
xmlns:android=[http://schemas.android.com/apk/res/android](http://schemas.android.com/apk/res/android)

android:orientation="horizontal"\
 android:layout\_width="fill\_parent"\
 android:layout\_height="wrap\_content"\
 android:gravity="bottom"\>\
 \<Button

\
 \<Button

\
 \<Button

\
 \<Button

\
 \
 \

3、在menu上定义style，限制menu的区域把不用的区域隐藏起来。Styles.xml如下：\
 \
 1\
 2\
 3\
 4\
 5\
 6\
 7\

\

4、在AndroidManifest.xml文件activity元素中一定要加上这样一句：android:theme=“@style/Theme.Translucent”。这句话的意思是使用我们自定义的name为Theme.Translucent风格。\
 \
 \
 5、在主 activity中显示menu，需要在onKeyUp()中监听menu
button按下的消息，当menu
button按下后，显示我们自定义的menu（其实是activity），再次按下时关闭menu。而且显示menu时，我加入了一个动画，加入的方法
很简单，只需调用overridePendingTransiton(R.anim.fade,
R.anim.hold),这个函数的参数是自定义的动画xml。详见附件！\
 \
 \
 \
 \
 总结\
 \
 这
篇文章主要是用activity制作了一个menu，并实现半透明。使用了style，而且自定义的style是继承自
android:style/Theme.Translucent，如果不继承它，在style的name字段中是不能使用点(.)的，大家可自行验证。
同时也使用的animation，只是出于学习的目的。最后祝大家学习愉快，学习的过程中可以把自己的成果拿出来跟大家分享。谢谢！\
 \

