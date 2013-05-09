parent nodes: [ObjC](ObjC.html)\
\

查看NS Character Set每个Set的内容 {.heading-level2}
---------------------------------

//Reference
[http://www.cocoadev.com/index.pl?NSCharacterSet](http://www.cocoadev.com/index.pl?NSCharacterSet)\
 \
 \#import \<Cocoa/Cocoa.h\>\
 \
 //
----------------------------------------------------------------------------------------\
 // dumpCharacterSet\
 //\
 // Print out the contents of the given character set so we can see
**exactly** what's inside\
 // the thing for reference.\
 //\
 //
----------------------------------------------------------------------------------------\
 void dumpCharacterSet( NSString **name )\
 {**

unichar idx;\
 NSCharacterSet \*cset = [NSCharacterSet performSelector:
NSSelectorFromString(name)];\
 \
 printf("Character set (0-127): %sn7-Bit: ", [name cString]);\
 \
 for( idx = 0; idx \< 256; idx++ )\
 {

if ( 128 == idx ) {

}\
 \
 if ([cset characterIsMember: idx])\
 {

if ( isprint(idx) ) {

}\
 else {

}

}

}\
 printf("nn");

}\
 \
 \
 \
 //
----------------------------------------------------------------------------------------\
 // CharSetGen\
 //\
 // This is a utility that is used to generate NSCharacterSet objects
that can be used to\
 // perform various parsing / testing functions for the coders.\
 //\
 //
----------------------------------------------------------------------------------------\
 int main(int argc, const char argv[])\
 {

}\
 \
 OutPut\
 \
 Size of a 'unichar' is: 2\
 Character set (0-127): alphanumericCharacterSet\
 7-Bit: 0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V
W X Y Z \^ \` a b c d e f g h i j k l m n o p q r s t u v w x y z \
 8-Bit: a8 aa af b2 b3 b4 b5 b8 b9 ba bc bd be c0 c1 c2 c3 c4 c5 c6 c7
c8 c9 ca cb cc cd ce cf d0 d1 d2 d3 d4 d5 d6 d8 d9 da db dc dd de df e0
e1 e2 e3 e4 e5 e6 e7 e8 e9 ea eb ec ed ee ef f0 f1 f2 f3 f4 f5 f6 f8 f9
fa fb fc fd fe ff \
 \
 Character set (0-127): controlCharacterSet\
 7-Bit: 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14
15 16 17 18 19 1a 1b 1c 1d 1e 1f 7f \
 8-Bit: 80 81 82 83 84 85 86 87 88 89 8a 8b 8c 8d 8e 8f 90 91 92 93 94
95 96 97 98 99 9a 9b 9c 9d 9e 9f \
 \
 Character set (0-127): decimalDigitCharacterSet\
 7-Bit: 0 1 2 3 4 5 6 7 8 9 \
 8-Bit: \
 \
 Character set (0-127): decomposableCharacterSet\
 7-Bit: \
 8-Bit: c0 c1 c2 c3 c4 c5 c7 c8 c9 ca cb cc cd ce cf d1 d2 d3 d4 d5 d6
d9 da db dc dd e0 e1 e2 e3 e4 e5 e7 e8 e9 ea eb ec ed ee ef f1 f2 f3 f4
f5 f6 f9 fa fb fc fd ff \
 \
 Character set (0-127): illegalCharacterSet\
 7-Bit: \
 8-Bit: \
 \
 Character set (0-127): letterCharacterSet\
 7-Bit: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z \^ \` a b c
d e f g h i j k l m n o p q r s t u v w x y z \
 8-Bit: a8 aa af b4 b5 b8 ba c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 ca cb cc cd
ce cf d0 d1 d2 d3 d4 d5 d6 d8 d9 da db dc dd de df e0 e1 e2 e3 e4 e5 e6
e7 e8 e9 ea eb ec ed ee ef f0 f1 f2 f3 f4 f5 f6 f8 f9 fa fb fc fd fe ff
\
 \
 Character set (0-127): lowercaseLetterCharacterSet\
 7-Bit: a b c d e f g h i j k l m n o p q r s t u v w x y z \
 8-Bit: aa b5 ba df e0 e1 e2 e3 e4 e5 e6 e7 e8 e9 ea eb ec ed ee ef f0
f1 f2 f3 f4 f5 f6 f8 f9 fa fb fc fd fe ff \
 \
 Character set (0-127): nonBaseCharacterSet\
 7-Bit: \
 8-Bit: \
 \
 Character set (0-127): punctuationCharacterSet\
 7-Bit: ! " % ' ( ) , - . / : ; ? [ ] { } \
 8-Bit: a1 ab ad b7 bb bf \
 \
 Character set (0-127): uppercaseLetterCharacterSet\
 7-Bit: A B C D E F G H I J K L M N O P Q R S T U V W X Y Z \
 8-Bit: c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 ca cb cc cd ce cf d0 d1 d2 d3 d4
d5 d6 d8 d9 da db dc dd de \
 \
 Character set (0-127): whitespaceAndNewlineCharacterSet\
 7-Bit: 09 0a 0d \
 8-Bit: a0 \
 \
 Character set (0-127): whitespaceCharacterSet\
 7-Bit: 09 \
 8-Bit: a0 \
 \
 \
 CharSetGen.app has exited with status 0.
