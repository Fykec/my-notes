# AWK notes

2013-05-28 10:46:35

[AWK Manual](http://net.pku.edu.cn/~yhf/tutorial/awk_manual.html)

awk的语法： 

与其它UNIX命令一样，awk拥有自己的语法：

	awk [ -F re] [parameter...] ['prog'] [-f progfile][in_file...] 

参数说明：

-F re:允许awk更改其字段分隔符。

parameter: 该参数帮助为不同的变量赋值。

'prog': awk的程序语句段。这个语句段必须用单拓号：'和'括起，以防被shell解释。这个程序语句段的标准形式为：

'pattern {action}'

其 中pattern参数可以是egrep正则表达式中的任何一个，它可以使用语法/re/再加上一些样式匹配技巧构成。与sed类似，你也可以使用","分 开两样式以选择某个范围。关于匹配的细节，你可以参考附录，如果仍不懂的话，找本UNIX书学学grep和sed（本人是在学习ed时掌握匹配技术的）。 action参数总是被大括号包围，它由一系统awk语句组成，各语句之间用";"分隔。awk解释它们，并在pattern给定的样式匹配的记录上执行 其操作。与shell类似，你也可以使用“#”作为注释符，它使“#”到行尾的内容成为注释，在解释执行时，它们将被忽略。你可以省略pattern和 action之一，但不能两者同时省略，当省略pattern时没有样式匹配，表示对所有行（记录）均执行操作，省略action时执行缺省的操作——在 标准输出上显示。 

-f progfile:允许awk调用并执行progfile指定有程序文件。progfile是一个文本文件，他必须符合awk的语法。 

in_file:awk的输入文件，awk允许对多个输入文件进行处理。值得注意的是awk不修改输入文件。如果未指定输入文件，awk将接受标准输入，并将结果显示在标准输出上。awk支持输入输出重定向。 


##5.awk内置变量（预定义变量）

说明：表中v项表示第一个支持变量的工具（下同）：A=awk，N=nawk,P=POSIX awk,G=gawk

V 变量 含义 缺省值
--------------------------------------------------------
N ARGC 命令行参数个数 

G ARGIND 当前被处理文件的ARGV标志符

N ARGV 命令行参数数组

G CONVFMT 数字转换格式 %.6g

P ENVIRON UNIX环境变量

N ERRNO UNIX系统错误消息

G FIELDWIDTHS 输入字段宽度的空白分隔字符串

A FILENAME 当前输入文件的名字

P FNR 当前记录数

A FS 输入字段分隔符 空格

G IGNORECASE 控制大小写敏感0（大小写敏感）

A NF 当前记录中的字段个数

A NR 已经读出的记录数

A OFMT 数字的输出格式 %.6g

A OFS 输出字段分隔符 空格

A ORS 输出的记录分隔符 新行

A RS 输入的记录他隔符 新行

N RSTART 被匹配函数匹配的字符串首

N RLENGTH 被匹配函数匹配的字符串长度

N SUBSEP 下标分隔符 "\034"


##6.awk的内置函数

V 函数 用途或返回值
------------------------------------------------
N gsub(reg,string,target) 每次常规表达式reg匹配时替换target中的string

N index(search,string) 返回string中search串的位置

A length(string) 求串string中的字符个数

N match(string,reg) 返回常规表达式reg匹配的string中的位置

N printf(format,variable) 格式化输出，按format提供的格式输出变量variable。

N split(string,store,delim) 根据分界符delim,分解string为store的数组元素

N sprintf(format,variable) 返回一个包含基于format的格式化数据，variables是要放到串中的数据

G strftime(format,timestamp) 返回一个基于format的日期或者时间串，timestmp是systime()函数返回的时间

N sub(reg,string,target) 第一次当常规表达式reg匹配，替换target串中的字符串

A substr(string,position,len) 返回一个以position开始len个字符的子串

P totower(string) 返回string中对应的小写字符

P toupper(string) 返回string中对应的大写字符

A atan(x,y) x的余切(弧度)

N cos(x) x的余弦(弧度)

A exp(x) e的x幂

A int(x) x的整数部分

A log(x) x的自然对数值

N rand() 0-1之间的随机数

N sin(x) x的正弦(弧度)

A sqrt(x) x的平方根

A srand(x) 初始化随机数发生器。如果忽略x，则使用system()

G system() 返回自1970年1月1日以来经过的时间（按秒计算）