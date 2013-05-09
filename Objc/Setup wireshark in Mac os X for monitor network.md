parent nodes: [ObjC](ObjC.html)\
\

Setup wireshark in Mac os X for monitor network {.heading-level2}
-----------------------------------------------

[http://developer.admob.com/wiki/AppStoreDownloads\#Wiresharking\_your\_iPhone\_App](http://developer.admob.com/wiki/AppStoreDownloads#Wiresharking_your_iPhone_App)\
 \
 Wiresharking your iPhone App\
 \
 Follow these steps to set up Wireshark to sniff iPhone applications on
OS X -\
 Install (do once):

1.  

Run (do each time you restart your computer):

Give Wireshark access to sniff your network.

Open the Terminal application and run the following commands:\

1.  2.  3.  

The last one should list a few bpf entries, and critically, in the
permissions listing on the left, there should be three "r"s. \

Share a wireless network

1.  2.  3.  4.  5.  6.  7.  8.  9.  

Launch Wireshark. (It may launch slowly the first time.) Click OK if it
pops up an error.\

Configure Wireshark to only look at HTTP traffic from your wireless card
by following these steps:

1.  2.  3.  4.  5.  

If you want to filter to see only the stuff you want, follow these steps

1.  2.  3.  

After following the steps above, on your iPhone go to Settings -\> Wi-Fi
-\> turn Wi-Fi ON -\> find and join the network you created above. Then
download a new copy of your application on the device and watch
Wireshark capture all the packets that are sent back and forth. Any
traffic sent to AdMob can be seen through the packets captured.\
 \
 If you have integrated our download tracking code properly, wireshark
should show something similar to the following when filtering out for
http host admob:

GET /f0?isu=489D43B97061E1E732C1D24E26B57E05&md5=1&app\_id=123456789
HTTP/1.1rn

GET /f0?isu=489D43B97061E1E732C1D24E26B57E05&md5=1&app\_id=123456789
HTTP/1.1rn

Host: a.admob.comrn
