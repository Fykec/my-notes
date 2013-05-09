parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Android Tabhost Tab Widget {.heading-level2}
--------------------------

Android TabWidget/TabHost有两种使用方法：\
 \

第一种：使用系统自带写好的TabHost（及继承自TabActivity类）具体代码如下:\
 01\
 \<?xml version="1.0" encoding="utf-8"?\>\
 02\
 \<FrameLayout
xmlns:android="[http://schemas.android.com/apk/res/android](http://schemas.android.com/apk/res/android)"\
 03

04

05

06

07

08

09

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29\
 \
 \
 \
 \
 \
 \
 \
 01\
 package com.Aina.Android;\
 02\
 \
 03\
 import android.app.AlertDialog;\
 04\
 import android.app.Dialog;\
 05\
 import android.app.TabActivity;\
 06\
 import android.content.DialogInterface;\
 07\
 import android.os.Bundle;\
 08\
 import android.view.LayoutInflater;\
 09\
 import android.widget.TabHost;\
 10\
 \
 11\
 public class Test\_TabWidget extends TabActivity {\
 12

/**** Called when the activity is first created. **/\
 13\
 private TabHost tabHost;\
 14\
 \
 15\
 @Override\
 16\
 public void onCreate(Bundle savedInstanceState) {\
 17**

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32\
 // tabHost.setBackgroundColor(Color.GRAY);\
 33

34\
 \
 35

36

37

38

39\
 \
 40

41

42

43\
 \
 44

45\
 \
 46

47

48\
 \
 49

50\
 \
 51

52\
 }\
 53\
 }\
 \
 \
 \
 第二种：就是定义我们自己的tabHost：不用继承TabActivity，具体代码如下:\
 \
 01\
 \<?xml version="1.0" encoding="utf-8"?\>\
 02\
 \<TabHost
xmlns:android="[http://schemas.android.com/apk/res/android](http://schemas.android.com/apk/res/android)"\
 03\
 android:id="@+id/TabHost01" android:layout\_width="fill\_parent"\
 04\
 android:layout\_height="fill\_parent"\>\
 05\
 \<LinearLayout android:layout\_width="fill\_parent"\
 06

07

08

09

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32

33

34

35

36

37

38\
 \
 39\
 \
 \
 \
 01\
 package com.Aina.Android;\
 02\
 \
 03\
 import android.app.Activity;\
 04\
 import android.os.Bundle;\
 05\
 import android.util.Log;\
 06\
 import android.view.LayoutInflater;\
 07\
 import android.widget.TabHost;\
 08\
 \
 09\
 public class Test\_TabHost extends Activity {\
 10\
 /\* Called when the activity is first created. \*/

11

12\
 \
 13

14

15

16

17

18

19

20\
 \
 21

22

23

24

25

26

27

28

29

30

31

32

33

34

35\
 \
 36

37\
 }\
 \
 \
 \

注意：第二种方法时布局文件中的TabWidget的id必须定义为：android:id="@android:id/tabs"，FrameLayout的id必须定义为：android:id="@android:id/tabcontent"
其它控件没有限制，否则报错。
