parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Windows Explorer命令 {.heading-level2}
--------------------

Explorer命令\
 　　命令格式\
 　　Explorer [/n][/e]\
 　　参数说明\

　　/n表示以“我的电脑”方式打开一个新的窗口，通常打开的是Windows安装分区的根目录。\

　　/e表示以“资源管理器”方式打开一个新的窗口，通常打开的也是Windows安装分区的根目录。\

　　/root,[path]表示打开指定的文件夹，/root表示只显示指定文件夹下面的文件（夹），不显示其它磁盘分区和文件夹；[path]表示指定的路径。\

　　如果不加/root参数，而只用[path]参数，则可以显示其它磁盘分区和文件夹中的内容。另外，[path]还可以指定网络共享文件夹。\
 　　/select,[path
filename]表示打开指定的文件夹并且选中指定的文件，[path
filename]表示指定的路径和文件名。\
 　　如果不加/select参数，则系统会用相应的关联程序打开该文件。如果[path
filename]不跟文件名就会打开该文件夹的上级目录并选中该文件夹\
 应用实例\
 　　1.以“资源管理器”方式打开E盘根目录\
 　　单击“开始→运行”，输入“explorer
/e,/root,e:”，回车即可。如果需要显示其它磁盘分区和文件夹中的内容，可以输入“explorer
/e,e:”。\

　　2.以“我的电脑”方式打开“E:Download”目录下的QQ.exe文件在“开始→运行”中键入“explorer
/n,/select　e:downloadqq.exe”或“explorer
/select　e:downloadqq.exe”，回车即可。\
 　　3.通过“开始”菜单中的“Windows 资源管理器”命令打开特定窗口\
 　　以在Windows
XP下打开E盘根目录为例。首先在“开始”菜单中用鼠标右键单击“所有程序→附件→Windows
资源管理器”项，选择“属性”命令。接着在弹出窗口的“目标”栏中输入“%SystemRoot%explorer.exe
/e,e:”（默认值是“%SystemRoot%explorer.exe”）即可。\
 　　4.在右键菜单里添加“打开我的文件夹”命令打开特定文件\
 　　以在Windows
XP下打开“E:myfolder”文件夹为例。在“开始→运行”中输入“Regedit”，打开“注册表编辑器”，展开分支“HKEY\_CLASSES\_ROOTDirectoryshell，接着在右边窗口中新建一个名为“PersonalWindow”的子键，并将默认值改成“打开我的文件夹”；然后在“PersonalWindow”下新建一个名为“Command”的子键，在右侧的窗口中将“默认”值改为“explorer.exe
/e,E:myfolder”。这样就可以在浏览任何文件夹的时候，通过右键快捷菜单中的“打开我的文件夹”命令快速以资源管理器方式打开“E:myfolder”文件夹。\
 　　5.用命令直接打开我的电脑（有时候编程调用也要使用）\
 　　在运行里面直接运行Explorer.exe
,/root,{21EC2020-3AEA-1069-A2DD-08002B30309D}, "%1"\
 　　Explorer.exe ,/root,或者Explorer.exe ,/root, "%1"以及\
 　　explorer.exe /e,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\
 　　可以在注册表中得到[我的电脑]的CLSID，然后执行命令行\
 　　%SystemRoot%Explorer.exe /e,::{MyExtension CLSID},objectname\
 　　注册表的位置在\
 　　HKEY\_LOCAL\_MACHINE\
 　　Software\
 　　Microsoft\
 　　Windows\
 　　CurrentVersion\
 　　Explorer\
 　　Virtual Folder Name\
 　　Namespace\
 　　{Extension CLSID}\
 　　这里Virtual Folder Name是下列虚拟目录名称\
 　　Location Virtual Folder Name\
 　　My Computer MyComputer\
 　　Desktop Desktop\
 　　Control Panel ControlPanel\
 　　My Network Places NetworkNeighborhood\
 　　Entire Network NetworkNeighborhoodEntireNetwork\
 　　Remote Computer RemoteComputer
