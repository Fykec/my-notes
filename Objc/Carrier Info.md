parent nodes: [ObjC](ObjC.html)\
\

Carrier Info {.heading-level2}
------------

Carrier Information: Mobile Network Code (MNC) and Mobile Country Code
(MCC)\
 Posted on March 21, 2011 by John Muchow in Core Services\
 \
 \
 Tweet\
 \
 With the release of iOS 4, Apple introduced two new frameworks for
obtaining carrier information. CTCarrier offers information about the
cellular provider including the carrier name, Mobile Network Code and
Mobile Carrier Code. CTTelephonyNetworkInfo is the channel to access
information through CTCarrier, this class also provides an update
notifier if you need to detect changes to a changes in cellular provider
information, for example, if the user swaps out there SIM card.\
 \
 Also, before you build your app, add the CoreTelephony.framework to
your project.\
 \
 \#import \<CoreTelephony/CTCarrier.h\>\
 \#import \<CoreTelephony/CTTelephonyNetworkInfo.h\>\
 \
 // Setup the Network Info and create a CTCarrier object\
 CTTelephonyNetworkInfo **networkInfo = [[[CTTelephonyNetworkInfo alloc]
init] autorelease];\
 CTCarrier**carrier = [networkInfo subscriberCellularProvider];\
 \
 // Get carrier name\
 NSString **carrierName = [carrier carrierName];\
 if (carrierName != nil)**

// Get mobile country code\
 NSString mcc = [carrier mobileCountryCode];\
 if (mcc != nil)

// Get mobile network code\
 NSString **mnc = [carrier mobileNetworkCode];\
 if (mnc != nil)**

The output of this code on my iPhone is below:\
 \
 Lists of MCC and MNC\
 \
 Wikipedia Mobile Country Codes\
 \
 Wikipedia Mobile Network Codes (US Only)\
 \

[http://iphonedevelopertips.com/core-services/carrier-information-mobile-network-code-mnc-and-mobile-country-code-mcc.html](http://iphonedevelopertips.com/core-services/carrier-information-mobile-network-code-mnc-and-mobile-country-code-mcc.html)\
 \
 \
 \
 判断 iPhone 是否插入了 SIM 卡，可以参考苹果官网的 systemconfigure
framework 教程，将下面的代码复制到头文件：\
 \
 extern NSString const kCTSMSMessageReceivedNotification;\
 extern NSString\* const kCTSMSMessageReplaceReceivedNotification;\
 extern NSString\* const kCTSIMSupportSIMStatusNotInserted;\
 extern NSString\* const kCTSIMSupportSIMStatusReady; \
 \
 id CTTelephonyCenterGetDefault(void);\
 void
CTTelephonyCenterAddObserver(id,id,CFNotificationCallback,NSString**,void**,int);\
 void CTTelephonyCenterRemoveObserver(id,id,NSString**,void**);\
 int CTSMSMessageGetUnreadCount(void); \
 \
 int CTSMSMessageGetRecordIdentifier(void \* msg);\
 NSString \* CTSIMSupportGetSIMStatus(); \
 NSString \* CTSIMSupportCopyMobileSubscriberIdentity(); \
 \
 id CTSMSMessageCreate(void\* unknow/**always 0**/,NSString\*
number,NSString\* text);\
 void \* CTSMSMessageCreateReply(void\* unknow/**always 0**/,void \*
forwardTo,NSString\* text); \
 \
 void\* CTSMSMessageSend(id server,id msg); \
 \
 NSString **CTSMSMessageCopyAddress(void**, void **);\
 NSString**CTSMSMessageCopyText(void **, void**);\
 \
 \


