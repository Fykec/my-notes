parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Sd Card {.heading-level2}
-------

Android模拟器能够让我们使用fat32格式的磁盘镜像作为SD卡的模拟： \
 以下所有操作均在windows环境\
 \
 首先，运行cmd，进入命令行界面（需要预先将你放置android
sdk所在目录下的tools设置到环境变量path中）\
 \
 以下除eclipse方式，其他均在命令行运行\
 \
 1. 创建SD文件\
 \
 命令行方式： mksdcard -l sdcard 512M d:/android/mysdcard/sdcard.img
这样就在d:/android/mysdcard/sdcard.img 创建了一个512M的SD卡镜像文件 \
 \
 mksdcard参数如下： \
 \
 mksdcard: create a blank FAT32 image to be used with the Android
emulator\
 usage: mksdcard [-l label] \

2.在模拟器中加载刚创建的SD文件\
 \
 命令行方式：emulator -sdcard d:/android/mysdcard/sdcard.img\
 \
 eclipse方式：（前提是安装了google android 插件）， 选择菜单“Run” -\>
"Run Configurations..."
，进入弹出页面，选择"Targets"标签，在最下面一行"Aditional Emulator
Command Line Options"下面增加启动参数 -sdcard
d:/android/mysdcard/sdcard.img\
 \
 3.向SD卡传输文件（管理SD卡上的内容）\
 \
 可以用mtools来做管理，也可以用android SDK带的命令：\
 adb push local\_file sdcard/remote\_file\
 \
 local\_file表示要传输的文件绝对路径，或与Tools目录的相对路径\
 \
 remote\_file为Qemu中Linux目录/sdcard/文件名\
 \
 eclipse方式：\
 \
 通过DDMS标签中的File Explorer文件浏览器在传输如图：\
 \
 \
 \
 发表于 @ 2009年03月03日　16:11:00 | 评论( 1 ) | 编辑| 举报| 收藏 \
 \
 旧一篇:看到一强贴，wince中居然可以用Labview |
新一篇:Android框架的深度分析1\
 查看最新精华文章 请访问博客首页相关文章\
 [转]如何在Google Android模拟器中使用SD卡（命令行和eclipse环境）Android
SDK
使用技巧Android模拟器中磁盘模拟SD卡为模拟器增加一个1G的SD卡Android教程之如何安装(卸载)apk文件到模拟器ndroid模拟器SD
Card映像文件使用方法Android SDK
使用技巧Android模拟器使用SD卡Seaside\_Boy 发表于2010年1月12日 23:48:15
IP:举报回复删除\
 多谢！发表评论表 情： 评论内容： 用 户 名：登录 注册 匿名评论
yinjiaji验 证 码： 重新获得验证码

北京创新乐知信息技术有限公司 版权所有, 京 ICP 证 070598 号\
 世纪乐知(北京)网络技术有限公司 提供技术支持\
 江苏乐知网络技术有限公司 提供商务支持

Copyright © 1999-2010, CSDN.NET, All Rights Reserved\
 \
 \

本文来自CSDN博客，转载请标明出处：[http://blog.csdn.net/jinlking/archive/2009/03/03/3953319.aspx](http://blog.csdn.net/jinlking/archive/2009/03/03/3953319.aspx)
