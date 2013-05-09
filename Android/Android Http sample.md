parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Android Http sample {.heading-level2}
-------------------

import java.net.**;\
 import java.io.**;\
 \
 public class URLConnectionReader {

public static void main(String[] args) throws Exception {

URL yahoo = new URL("[http://www.yahoo.com/](http://www.yahoo.com/)");\
 URLConnection yc = yahoo.openConnection();\
 BufferedReader in = new BufferedReader(

String inputLine;\
 \
 while ((inputLine = in.readLine()) != null)

in.close();

}

}
