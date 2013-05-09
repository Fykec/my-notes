parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Task与Activity详解 {.heading-level2}
------------------

原创 Task与Activity详解 收藏\
 \
 1. Task是包含一系列Activity的堆栈, 遵循先进后出原则. \
 \
 2. Task默认行为: \

​(1) 前提: Activity A和Activity B在同一个应用中. \

​(2) 前提: Activity A和Activity B在同一个应用中,
应用名称为"TaskOne应用".\

操作: 在Launcher中单击"TaskOne应用"图标, Activity A启动开僻Task堆栈,
命名为TaskA(TaskA堆栈状态: A),\

​(3) 前提: Activity A在名称为"TaskOne应用"的应用中, Activity
C在名称为"TaskTwo应用"的应用中.\

操作: 在Launcher中单击"TaskOne应用"图标, Activity A启动开僻Task堆栈,
命名为TaskA(TaskA堆栈状态: A),\

​3. Intent FLAG介绍:\

​(1) FLAG\_ACTIVITY\_NEW\_TASK: \

​a. 前提: Activity A和Activity B在同一个应用中. \

操作: Activity A启动开僻Task堆栈(堆栈状态: A), 在Activity
A中启动Activity B, 启动Activity B的Intent的Flag设为\

原因: 默认情况下同一个应用中的所有Activity拥有相同的关系(taskAffinity).\

​b. 前提: Activity A在名称为"TaskOne应用"的应用中, Activity C和Activity
D在名称为"TaskTwo应用"的应用中.\

操作1: 在Launcher中单击"TaskOne应用"图标, Activity A启动开僻Task堆栈,
命名为TaskA(TaskA堆栈状态: A),\

操作2: 在Launcher中单击"TaskOne应用"图标, Activity A启动开僻Task堆栈,
命名为TaskA(TaskA堆栈状态: A),\

​(2) FLAG\_ACTIVITY\_CLEAR\_TOP:\

前提: Activity A, Activity B, Activity C和Activity D在同一个应用中.\
 \
 操作: Activity A启动开僻Task堆栈(堆栈状态: A), 在Activity
A中启动Activity B(堆栈状态: AB), 在Activity B中启动\

​(3) FLAG\_ACTIVITY\_BROUGHT\_TO\_FRONT:\

前提: Activity A在名称为"TaskOne应用"的应用中, Activity C和Activity
D在名称为"TaskTwo应用"的应用中.\
 \
 操作: 在Launcher中单击"TaskOne应用"图标, Activity A启动开僻Task堆栈,
命名为TaskA(TaskA堆栈状态: A),\

​(4) FLAG\_ACTIVITY\_MULTIPLE\_TASK:\

​(5) FLAG\_ACTIVITY\_SINGLE\_TOP:\

​(6) FLAG\_ACTIVITY\_RESET\_TASK\_IF\_NEEDED:\

例: 存在Activity A, Activity B, Activity C, Activity A启动开僻Task堆栈,
命名为TaskA(TaskA堆栈状态: A),\

​4. launchMode介绍:\

​(1) standard: \

​(2) singleTop: \

​(3) singleTask: \

"launchMode"设置为"singleTask"的Activity总是在栈底, 只能被实例化一次,
它允许其它Activity压入"singleTask"的Activity\

​(4) singleInstance: \

​5. taskAffinity属性: \

​(1)
taskAffinity属性应和FLAG\_ACTIVITY\_NEW\_TASK标志及allowTaskReparenting属性结合使用,
如果只使用taskAffinity属性,\

​(2) 与FLAG\_ACTIVITY\_NEW\_TASK标志结合:\

​a. 前题: Activity A和Activity B在同一个应用中, Activity A与Activity
B设置不同的taskAffinity属性.\

操作: Activity A启动开僻Task堆栈,命名为TaskA(TaskA堆栈状态: A),
在Activity A中启动Activity B, 启动Activity B\

​b. 前题: Activity A在"TaskOne应用"中, Activity C在"TaskTwo应用"中,
Activity A和ActivityC设置了相同的taskAffinity属性.\

操作: Activity A启动开僻Task堆栈,命名为TaskA(TaskA堆栈状态: A),
在Activity A中启动Activity C, 启动Activity C的\

​(3) 与allowTaskReparenting属性:\

例: 在"TaskOne应用"中有一个天气预报Activity A, Activity
A与"TaskOne应用"中的其它Activity有默认的关系\

​6. alwaysRetainTaskState属性:\

​7. clearTaskOnLaunch属性: \

​8. finishOnTaskLaunch属性:\


