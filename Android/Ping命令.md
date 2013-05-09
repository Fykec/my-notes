parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Ping命令 {.heading-level2}
--------

\
 ping命令详解 \
 \
 使用 ping可以测试计算机名和计算机的 ip
地址,验证与远程计算机的连接,通过将 icmp
回显数据包发送到计算机并侦听回显回复数据包来验证与一台或多台远程计算机的连接,该命令只有在安装了
tcp/ip 协议后才可以使用。
现在打开你的ms-dos(开始→程序→ms-dos)，用win2000的朋友打开cmd.exe（这是win2000下的ms-dos，开始→程序→附件→"命令提示符"
或 开始→搜索文件或文件夹→"填入cmd.exe",找到后双击运行就可以了。）
下面我们来看看他的命令：\
 \
 ping [-t] [-a] [-n count] [-l length] [-f] [-i ttl] [-v tos] [-r count]
[-s count] [[-j computer-list] | [-k computer-list]] [-w timeout]
destination-list\
 \
 参数\
 \
 -t\
 \
 ping 指定的计算机直到中断。ctrl+c停止\
 \
 -a\
 \
 将地址解析为计算机名。例:c:\>ping -a 127.0.0.1\
 \
 pinging china-hacker [127.0.0.1] with 32 bytes of
data:（china-hacker就是他的计算机名）\
 \
 reply from 127.0.0.1: bytes=32 time\<10ms ttl=128reply from 127.0.0.1:
bytes=32 time\<10ms ttl=128reply from 127.0.0.1: bytes=32 time\<10ms
ttl=128reply from 127.0.0.1: bytes=32 time\<10ms ttl=128\
 \
 ping statistics for 127.0.0.1:packets: sent = 4, received = 4, lost = 0
(0% loss),approximate round trip times in milli-seconds:minimum = 0ms,
maximum = 0ms, average = 0ms\
 \
 -n count\
 \
 发送 count 指定的 echo 数据包数。默认值为 4。\
 \
 -l length\
 \
 发送包含由 length 指定的数据量的 echo 数据包。默认为 32 字节；最大值是
65,527。\
 \
 -f\
 \
 在数据包中发送“不要分段”标志。数据包就不会被路由上的网关分段。\
 \
 -i ttl\
 \
 将“生存时间”字段设置为 ttl 指定的值。\
 \
 -v tos\
 \
 将“服务类型”字段设置为 tos 指定的值。\
 \
 -r count\
 \
 在“记录路由”字段中记录传出和返回数据包的路由。count 可以指定最少 1
台，最多 9 台计算机。\
 \
 -s count\
 \
 指定 count 指定的跃点数的时间戳。\
 \
 -j computer-list\
 \
 利用 computer-list
指定的计算机列表路由数据包。连续计算机可以被中间网关分隔（路由稀疏源）ip
允许的最大数量为 9。\
 \
 -k computer-list\
 \
 利用 computer-list
指定的计算机列表路由数据包。连续计算机不能被中间网关分隔（路由严格源）ip
允许的最大数量为 9。\
 \
 -w timeout\
 \
 指定超时间隔，单位为毫秒。\
 \
 destination-list\
 \
 指定要 ping 的远程计算机。\
 \
 c:\>ping ds.internic.net\
 \
 pinging ds.internic.net [192.20.239.132] with 32 bytes of data:
（192.20.239.132 他的ip地址）\
 \
 reply from 192.20.239.132:bytes=32 time=101ms ttl=243\
 \
 reply from 192.20.239.132:bytes=32 time=100ms ttl=243\
 \
 reply from 192.20.239.132:bytes=32 time=120ms ttl=243\
 \
 reply from 192.20.239.132:bytes=32 time=120ms ttl=243\

