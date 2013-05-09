parent nodes: [Error handling](Error%20handling.html)\
\

使用JSON报的一个错误java\_lang\_Class Not Found Exception {.heading-level2}
---------------------------------------------------------

前在做项目的时候就曾接触过JSON的技术，但那个时候是项目经理把所有该配制的都配了，工具类也提供了，如何使用也跟我们说了，那个时候只是觉得很好用，倒没有研究过。

java.lang.ClassNotFoundException:
org.apache.commons.lang.exception.NestableRuntimeException\

上网上搜了一下才知道原来在使用JSON的使用的时候，不光要导入JSON这个包，同时还要导入另外三个包\
 总之，共需要下面的 jars，json-lib方可使用：\
 commons-beanutils-1.7.0.jar \
 commons-lang-2.1.jar \
 ezmorph-1.0.2.jar \
 json-lib-1.1-jdk15.jar\
 \

看来不管是什么技术，哪怕是再简单的，只有自己亲自尝试了才会知道问题呀！！
