parent nodes: [ObjC](ObjC.html)\
\

genstrings {.heading-level2}
----------

Localizable strings\
 When you want to localize your application, you generally localize your
strings first by using the genstrings command. Most people will tell you
to run something like this:\
 genstrings ./Classes/**.m\
 \
 That’s not the best way to do things though, as you might have source
files in other directories, especially if you’re developing a Universal
application. Instead, go to the top of your directory structure and run
this command:\
 find . -name '**.m' | xargs genstrings\
 \
 That will recursively look through your entire directory structure,
find all the .m files, and then pass those to genstrings.\
 \
 \
 \
 From:
[http://gargoylesoft.com/blog/2011/02/localizable-strings/](http://gargoylesoft.com/blog/2011/02/localizable-strings/)\
 \

[http://blog.csdn.net/wave\_1102/article/details/6359715](http://blog.csdn.net/wave_1102/article/details/6359715)
