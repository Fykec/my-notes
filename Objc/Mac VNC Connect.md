parent nodes: [ObjC](ObjC.html)\
\

Mac VNC Connect {.heading-level2}
---------------

为了项目展示需要，要从Windows远程桌面连接Mac OS
X，调研半天终于成功，记录如下：\
 \
 1.Mac OS X VNC服务设置\
 Mac OS X 10.5已经增加支持了由VNC Viewer访问的功能，设置如下\

系统偏好设置-共享-勾选“屏幕共享”，然后在电脑设置—VNC显示程序可以使用密码控制屏幕输入8位密码，并输入登录使用的密码允许设置，这样就可以通过其它PC或Mac上的VNC
Viewer来连接这台Msc进行远程控制了。\
 \
 2.安装VNC Client for Windows\
 1)下载安装\

[http://www.softii.com/downinfo/26165.html](http://www.softii.com/downinfo/26165.html)\
 序列号：ELBMU-ZFYMV-2HC77-73M46-UL4TA\
 Windows中安装，可以安装VNC服务器和VNC Viewer，也可只安装VNC Viewer。\
 2)连接\
 安装后在VNC Viewer右键新建连接，输入Mac的IP地址\
 会弹出警告：服务器不标准，可能工作失败。忽略警告\
 输入在Mac中设置的8位密码即可\
 注意：在VNC Viewer选项中Option里选择Color
level-\>full，否则一闪就没了。\
 另外选项中inputs里的enable 3-button mouse
emulation选上方便Mac鼠标使用。\
 \
 备注：VNC简介\
 VNC（Virtual Network
Computing，虚拟网络计算）最早是一套由英国剑桥大学AT&T实验室在2002年开发的轻量型的远程控制计算机软件，其采用了
GPL 授权条款，任何人都可免费取得该软件。VNC软件主要由两个部分组成：VNC
server及VNC viewer。用户需先将VNC
server安装在被控端的计算机上后，才能在主控端执行 VNC viewer 控制被控端。
　　VNC server 与 VNC viewer 支持多种操作系统，如 windows，Linux，MacOS
及 Unix 系列（Unix，Solaris等），因此可将 VNC server 及 VNC viewer
分别安装在不同的操作系统中进行控制。RealVNC
的优越性还在于如果操作系统的主控端计算机没有安装 VNC
viewer，也可以通过一般的网络浏览器（如 IE 等）来控制被控端（需要 Java
虚拟机的支持）。VNC的远程基本等同于远程桌面的console连接。　　\
 整个 VNC 一般运行的工作流程如下：\
 1.VNC 客户端通过浏览器或 VNC Viewer 连接至 VNC Server。\
 2.VNC Server
传送一对话窗口至客户端，要求输入连接密码（可能为空），以及存取的 VNC
Server 显示装置。\
 3.在客户端输入连接密码后，VNC Server 验证客户端是否具有存取权限。\
 4.若是客户端通过 VNC Server 的验证，客户端即要求 VNC Server
显示桌面环境。\
 5.被控端将画面显示控制权交由 VNC Server 负责。\
 6.VNC Server 将把被控端的桌面环境利用 VNC
通信协议送至客户端，并且允许客户端控制 VNC Server
的桌面环境及输入装置。\
 \
 \

[http://afantihust.blog.51cto.com/2231549/481884](http://afantihust.blog.51cto.com/2231549/481884)\
 \
 \
 Mac 上不需要安裝 VNC
Server，只要到「系統偏好設定」中的「共享」，把「螢幕共享」打勾才可使用，如果要設定密碼的話，按下「電腦設定」就可以設定了。\
 要連線也很簡單，只要打開 Safari
瀏覽器，在網址列輸入「VNC://XXX.XXX.XXX.XXX」即可連線，
也就是你想要連線的IP。不只是可以連 Mac 的共享螢幕，連 Windows 的 VNC
也可以連線，圖片可以參考第一張截圖。
