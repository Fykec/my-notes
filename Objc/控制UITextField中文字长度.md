parent nodes: [ObjC](ObjC.html)\
\

控制UI Text Field中文字长度 {.heading-level2}
---------------------------

UITextField
文字的编辑区域恢在initWithFrame里面调用，如果传个Frame进去，就可以正常控制文字的编辑区域\

如果用init方法来初始化，那么这样再设frame的话，不会影响的文字的编辑区域的frame设置，当然也可以在layoutsubvies里面更新文字的\

编辑区域大小，这样设frame时，就可以更新编辑区域大小，但是这里layousubviews始终被很多时刻调用，所以这样不好\
 \
 \
 trim字符串\
 - (NSString **)trimString:(NSString**)srcString font:(UIFont \*)font
limitLength:(float)limitLength\
 {

float orginalLength = [srcString sizeWithFont:font].width;\
 float rate = orginalLength / limitLength;\
 if (rate \> 1.00)\
 {

}\
 else\
 {

}

}
