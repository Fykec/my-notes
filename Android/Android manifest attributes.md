parent nodes: [AndroidManifest](AndroidManifest.html)\
\

Android manifest attributes {.heading-level2}
---------------------------

\< activity android:allowTaskReparenting="false"\
 \
 android:alwaysRetainTaskState="false"\
 \
 android:clearTaskOnLaunch="false"\
 \
 android:configChanges=["mcc", "mnc", "locale", "touchscreen",
"keyboard", "keyboardHidden", "navigation", "orientation",
"screenLayout", "fontScale", "uiMode"]\
 \
 android:enabled="false"\
 \
 android:excludeFromRecents="false"\
 \
 android:exported="false"\
 \
 android:finishOnTaskLaunch="false"\
 \
 android:icon="drawable resource"\
 \
 android:label="string resource"\
 \
 android:launchMode="singleTop" | "singleTask" | "singleInstance"\
 \
 android:multiprocess="false"\
 \
 android:name="string"\
 \
 android:noHistory="false"\
 \
 android:permission="string"\
 \
 android:process="string"\
 \
 android:screenOrientation="user" | "behind" | "landscape" | "portrait"
| "sensor" | "nosensor"\
 \
 android:stateNotNeeded="false"\
 \
 android:taskAffinity="string"\
 \
 android:theme="resource or theme"\
 \
 android:windowSoftInputMode=["stateUnspecified", "stateUnchanged",
"stateHidden", "stateAlwaysHidden", "stateVisible",
"stateAlwaysVisible", "adjustUnspecified", "adjustResize", "adjustPan"]
\> . . .\< /activity\>\
 \
 　　亲戚为任务的一个标识,表示活动与任务的从属关系.\
 \
 　　android:allowTaskReparenting\
 \

　　是否可以将目标activity从启动它的那个Task移动到他自己定义的而且马上要显示的那个Task.如果为false,它就会留在启动它的那个Task中.\
 \
 　　android:alwaysRetainTaskState\
 \
 　　是否让系统保留任务的最后状态. 一般情况下,
在按home键后再次启动应用,系统会去除栈内所有在根活动之上的活动;
或者某任务经过一段时间没有被访问时也会被系统清除其他活动.
本选项仅对根活动有意义,其他活动包含此标签会被忽略.\
 \
 　　android:clearTaskOnLaunch\
 \
 　　是否在从 home 界面重新启动时清空Task. 如果为 true,
每次用户启动任务,
用户都被带到根活动.不管他们最后在做什么,也不管是按BACK或HOME键最后离开的它.
如果是 false, 则不会这样.\
 \
 例如,假设用户从 home 启动 P , 然后从P启动 Q , 用户又点击了HOME,
然后又启动了P. 正常情况下用户将会看到Q, 因为这是用户最后在 P 中做的工作.
如果P中将此标志设置为 true ,当用户点击 home
时所有的P之上的活动都会被清除, 所以用户再次点击回来时会只能看到 P.\
 \
 　　如果这个属性和 allowTaskReparenting 同时为 true 时, 所有的可以被
re-parented 的活动都被移到他们共享亲戚关系的任务中,
剩下的活动都被丢弃了.\
 \
 　　android:finishOnTaskLaunch\
 \
 　　在用户从 home 界面重新启动应用时, 是否结束掉这个活动.
如果这个属性和 allowTaskReparenting 同时为 true 时,
本属性会干掉那一个属性. 本活动的亲戚也会被忽略. 这个活动将会被销毁.\
 \
 　　android:launchMode\
 \
 　　用例启动模式多实例注释\
 \

　　适合大部分活动的普通模式"standard"Yes默认值.系统总是会创建一个新实例\
 \

　　"singleTop"Conditionally如果一个实例已经存在在目标任务的栈顶,则复用,否则会创建新实例.
可以通过重写 onNewIntent() 来捕获\
 \
 　　特殊启动方法\
 \

　　(不推荐用于一般应用)"singleTask"No如果目标活动不存在,则会创建它并放在目标任务栈底,
然后启动它;\
 \
 　　如果目标活动已存在, 则会启动它并执行它的 onNewIntent() 方法\
 \
 　　"singleInstance"No与 "singleTask" 相同,
但是这个活动将会独占一个任务\
 \
 \
 \
 android:allowTaskReparenting\
 \
 是否允许activity更换从属的任务，比如从短信息任务 切换到浏览器任务。

* * * * *

android:alwaysRetainTaskState\
 \
 是否保留状态不变， 比如切换回home, 再从新打开， activity处于最后的状态

* * * * *

android:clearTaskOnLanunch\
 \
 比如 P 是 activity, Q 是被P 触发的 activity, 然后返回Home, 从新启动 P，
是否显示 Q

* * * * *

android:configChanges\
 \
 当配置list发生修改时， 是否调用 onConfigurationChanged() 方法 比如
"locale|navigation|orientation".

* * * * *

\
 android:enabled\
 \
 activity 是否可以被实例化,

* * * * *

\
 android:excludeFromRecents\
 \
 是否可被显示在最近打开的activity列表里

* * * * *

android:exported\
 \
 是否允许activity被其它程序调用

* * * * *

android:finishOnTaskLaunch\
 \
 是否关闭已打开的activity当用户重新启动这个任务的时候

* * * * *

android.icon

* * * * *

android:label

* * * * *

android:launchMode\
 \
 activity启动方式， "standard" "singleTop" "singleTask" "singleInstance"
其中前两个为一组， 后两个为一组

* * * * *

\
 android:multiprocess\
 允许多进程

* * * * *

android:name\
 \
 activity的类名， 必须指定\

* * * * *

android:onHistory\
 是否需要移除这个activity当用户切换到其他屏幕时。 这个属性是 API level 3
中引入的

* * * * *

\
 android:permission

* * * * *

android:process\
 一个activity运行时所在的进程名，
所有程序组件运行在应用程序默认的进程中，这个进程名跟应用程序的包名一致。中的元素process属性能够为所有组件设定一个新的默认值。但是任何组件都可以覆盖这个默认值，允许你将你的程序放在多进程中运行。
如果这个属性被分配的名字以:开头， 当这个activity运行时,
一个新的专属于这个程序的进程将会被创建。 如果这个进程名以小写字母开头，
这个activity将会运行在全局的进程中，被它的许可所提供。

* * * * *

\
 android:screenOrientation\
 \
 activity显示的模式, "unspecified" 默认值 "landscape"
风景画模式，宽度比高度大一些 "portrait" 肖像模式, 高度比宽度大。 "user"
用户的设置 "behind" "sensor" "nosensor"\

* * * * *

\
 android:stateNotNeeded\
 \
 是否 activity被销毁和成功重启并不保存状态\

* * * * *

\
 android:taskAffinity\
 \
 activity的亲属关系， 默认情况同一个应用程序下的activity有相同的关系\

* * * * *

\
 android:theme\
 \
 activity的样式主题, 如果没有设置，则activity的主题样式从属于应用程序，
参见元素的theme属性

* * * * *

\
 android:windowSoftInputMode\
 \
 activity主窗口与软键盘的交互模式, 自从API level 3 被引入
