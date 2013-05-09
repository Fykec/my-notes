parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Access sql语句创建表及字段类型 {.heading-level2}
------------------------------

创建一张空表：\
 Sql="Create TABLE [表名]"\
 \
 创建一张有字段的表：\
 Sql="Create TABLE [表名]([字段名1] MEMO NOT NULL, [字段名2] MEMO,
[字段名3] COUNTER NOT NULL, [字段名4] DATETIME, [字段名5] TEXT(200),
[字段名6] TEXT(200))\
 \
 字段类型：

11 : "Bit", // 是否\
 13 : "TimeStamp",\
 17 : "TinyInt", // 字节\
 72 : "UniqueIdentifier", // 同步复制 ID\
 128 : "Binary",\
 129 : "Char",\
 130 : "NChar",\
 131 : "Decimal", // 小数\
 133 : "DateTime",\
 135 : "SmallDateTime",\
 200 : "VarChar",\
 201 : "Text",\
 202 : "VarChar", // 文本\
 203 : "Text", // 备注\
 204 : "Binary", // 二进制\
 205 : "Image" // OLE 对象\
 以下字段为无编码字段（NChar、NVarchar、NText型）\
 8,128,130,202,203,204,205\

以下字段为按当前系统内码编码的字段（Asp中可用CodePage=936纠正为gb2312内码）\
 129,200,201\
 \
 在现有的表中增加字段：\
 Sql="alter table [表名] add column [字段名] varchar(200)"\
 \
 修改字段类型：\
 Sql="alter table [表名] Alter COLUMN 字段名] varchar(50)"\
 \
 删除表：\
 Sql="Drop table [表名]"\
 \
 删除字段：\
 sql="alter table [表名] drop [字段名]"\
 \
 修改字段：Alter TABLE [表名] Alter COLUMN [字段名] 类型(大小) NULL\
 \
 新建约束：Alter TABLE [表名] ADD CONSTRAINT 约束名 CHECK ([约束字段]
\<= '2007-1-1')\
 \
 删除约束：Alter TABLE [表名] Drop CONSTRAINT 约束名\
 \
 新建默认值：Alter TABLE [表名] ADD CONSTRAINT 默认值名 DEFAULT
'Gziu.CoM' FOR [字段名]\
 \
 删除默认值：Alter TABLE [表名] Drop CONSTRAINT 默认值名\
 \
 \
 =======================================\
 \
 conn.open connstr\
 sql="alter table [tablename] add hehe char(20)"\
 conn.execute(sql)\
 response.write("添加成功")\
 \
 ACCESS新建数据库和表还不简单，有了表字段初始化就更简单 \
 \
 \
 =======================================\
 \
 \
 \
 ================================\
 \
 生成数据表，添加字段，其中id字段为自动增加，测试通过\~\~\
 \
 Sub GenAutoIncrementFld()\
 set cn=server.CreateObject("ADODB.Connection")\
 set clx=server.CreateObject("ADOX.Column")\
 set cat=server.CreateObject("ADOX.Catalog")\
 set tblnam=server.CreateObject("ADOX.Table")\

End Sub\
 \
 call GenAutoIncrementFld\
 \
 ===================================\
 \
 字段类型对应数值\
 \
 ''---- DataTypeEnum Values ---- \
 Const adEmpty = 0 \
 Const adTinyInt = 16 \
 Const adSmallInt = 2 \
 Const adInteger = 3 \
 Const adBigInt = 20 \
 Const adUnsignedTinyInt = 17 \
 Const adUnsignedSmallInt = 18 \
 Const adUnsignedInt = 19 \
 Const adUnsignedBigInt = 21 \
 Const adSingle = 4 \
 Const adDouble = 5 \
 Const adCurrency = 6 \
 Const adDecimal = 14 \
 Const adNumeric = 131 \
 Const adBoolean = 11 \
 Const adError = 10 \
 Const adUserDefined = 132 \
 Const adVariant = 12 \
 Const adIDispatch = 9 \
 Const adIUnknown = 13 \
 Const adGUID = 72 \
 Const adDate = 7 \
 Const adDBDate = 133 \
 Const adDBTime = 134 \
 Const adDBTimeStamp = 135 \
 Const adBSTR = 8 \
 Const adChar = 129 \
 Const adVarChar = 200 \
 Const adLongVarChar = 201 \
 Const adWChar = 130 \
 Const adVarWChar = 202 \
 Const adLongVarWChar = 203 \
 Const adBinary = 128 \
 Const adVarBinary = 204 \
 Const adLongVarBinary = 205 \
 Const adChapter = 136 \
 Const adFileTime = 64 \
 Const adPropVariant = 138 \
 Const adVarNumeric = 139 \
 Const adArray = &H2000\
 \

在表的设计视图中，每一个字段都有设计类型，Access允许九种数据类型：文本、备注、数值、日期/时间、货币、自动编号、是/否、OLE对象、超级链接、查询向导。
\
 \

　文本：这种类型允许最大255个字符或数字，Access默认的大小是50个字符，而且系统只保存输入到字段中的字符，而不保存文本字段中未用位置上的空字符。可以设置“字段大小”属性控制可输入的最大字符长度。
\

　备注：这种类型用来保存长度较长的文本及数字，它允许字段能够存储长达64000个字符的内容。但Access不能对备注字段进行排序或索引，却可以对文本字段进行排序和索引。在备注字段中虽然可以搜索文本，但却不如在有索引的文本字段中搜索得快。
\

　数字：这种字段类型可以用来存储进行算术计算的数字数据，用户还可以设置“字段大小”属性定义一个特定的数字类型，任何指定为数字数据类型的字型可以设置成“字节”、“整数”、“长整数”、“单精度数”、“双精度数”、“同步复制ID”、“小数”五种类型。在Access中通常默认为“双精度数”。
\

日期/时间：这种类型是用来存储日期、时间或日期时间一起的，每个日期/时间字段需要8个字节来存储空间。
\

　货币：这种类型是数字数据类型的特殊类型，等价于具有双精度属性的数字字段类型。向货币字段输入数据时，不必键入人民币符号和千位处的逗号，Access会自动显示人民币符号和逗号，并添加两位小数到货币字段。当小数部分多于两位时，Access会对数据进行四舍五入。精确度为小数点左方15位数及右方4位数。
\

　自动编号：这种类型较为特殊，每次向表格添加新记录时，Access会自动插入唯一顺序或者随机编号，即在自动编号字段中指定某一数值。自动编号一旦被指定，就会永久地与记录连接。如果删除了表格中含有自动编号字段的一个记录后，Access并不会为表格自动编号字段重新编号。当添加某一记录时，Access不再使用已被删除的自动编号字段的数值，而是重新按递增的规律重新赋值。
\

　是/否：这种字段是针对于某一字段中只包含两个不同的可选值而设立的字段，通过是/否数据类型的格式特性，用户可以对是/否字段进行选择。
\

　OLE对象：这个字段是指字段允许单独地“链接”或“嵌入”OLE对象。添加数据到OLE对象字段时，可以链接或嵌入Access表中的OLE对象是指在其他使用OLE协议程序创建的对象，例如WORD文档、EXCEL电子表格、图像、声音或其他二进制数据。OLE对象字段最大可为1GB，它主要受磁盘空间限制。
\

　超级链接：这个字段主要是用来保存超级链接的，包含作为超级链接地址的文本或以文本形式存储的字符与数字的组合。当单击一个超级链接时，WEB浏览器或Access将根据超级链接地址到达指定的目标。超级链接最多可包含三部分：一是在字段或控件中显示的文本；二是到文件或页面的路径；三是在文件或页面中的地址。在这个字段或控件中插入超级链接地址最简单的方法就是在“插入”菜单中单击“超级链接”命令。
\

　查阅向导：这个字段类型为用户提供了一个建立字段内容的列表，可以在列表中选择所列内容作为添入字段的内容。\
 \
 来自:
[http://hi.baidu.com/2234/blog/item/1346afc30dc1a159b219a80a.html](http://hi.baidu.com/2234/blog/item/1346afc30dc1a159b219a80a.html)
