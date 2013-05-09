parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

serial Version UID {.heading-level2}
------------------

Java中serialVersionUID的解释 serialVersionUID作用：

有两种生成方式：

当你一个类实现了Serializable接口，如果没有定义serialVersionUID，Eclipse会提供这个

提示功能告诉你去定义
。在Eclipse中点击类中warning的图标一下，Eclipse就会\
 自动给定两种生成的方式。如果不想定义它，在Eclipse的设置中也

可以把它关掉的，设置如下：

如果你没有考虑到兼容性问题时，就把它关掉，不过有这个功能是好的，只要任何类别实现了Serializable这个接口的话，如果没有加入serialVersionUID，Eclipse都会给你warning提示，这个serialVersionUID为了让该类别Serializable向后兼容。
\
 \

如果你的类Serialized存到硬盘上面后，可是后来你却更改了类别的field(增加或减少或改名)，当你Deserialize时，就会出现Exception的，这样就会造成不兼容性的问题。
\
 \

但当serialVersionUID相同时，它就会将不一样的field以type的预设值Deserialize，可避开不兼容性问题。
