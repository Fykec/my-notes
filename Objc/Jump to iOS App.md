parent nodes: [ObjC](ObjC.html)\
\

Jump to i OS App {.heading-level2}
----------------

[http://stackoverflow.com/questions/9092142/ios-uialertview-button-to-go-to-setting-app](http://stackoverflow.com/questions/9092142/ios-uialertview-button-to-go-to-setting-app)\
 \
 NSURL\*url=[NSURL URLWithString:@"prefs:root=WIFI"];\
 [[UIApplication sharedApplication] openURL:url];\
 \
 About — prefs:root=General&path=About\
 Accessibility — prefs:root=General&path=ACCESSIBILITY\
 Airplane Mode On — prefs:root=AIRPLANE\_MODE\
 Auto-Lock — prefs:root=General&path=AUTOLOCK\
 Brightness — prefs:root=Brightness\
 Bluetooth — prefs:root=General&path=Bluetooth\
 Date & Time — prefs:root=General&path=DATE\_AND\_TIME\
 FaceTime — prefs:root=FACETIME\
 General — prefs:root=General\
 Keyboard — prefs:root=General&path=Keyboard\
 iCloud — prefs:root=CASTLE\
 iCloud Storage & Backup — prefs:root=CASTLE&path=STORAGE\_AND\_BACKUP\
 International — prefs:root=General&path=INTERNATIONAL\
 Location Services — prefs:root=LOCATION\_SERVICES\
 Music — prefs:root=MUSIC\
 Music Equalizer — prefs:root=MUSIC&path=EQ\
 Music Volume Limit — prefs:root=MUSIC&path=VolumeLimit\
 Network — prefs:root=General&path=Network\
 Nike + iPod — prefs:root=NIKE\_PLUS\_IPOD\
 Notes — prefs:root=NOTES\
 Notification — prefs:root=NOTIFICATIONS\_ID\
 Phone — prefs:root=Phone\
 Photos — prefs:root=Photos\
 Profile — prefs:root=General&path=ManagedConfigurationList\
 Reset — prefs:root=General&path=Reset\
 Safari — prefs:root=Safari\
 Siri — prefs:root=General&path=Assistant\
 Sounds — prefs:root=Sounds\
 Software Update — prefs:root=General&path=SOFTWARE\_UPDATE\_LINK\
 Store — prefs:root=STORE\
 Twitter — prefs:root=TWITTER\
 Usage — prefs:root=General&path=USAGE\
 VPN — prefs:root=General&path=Network/VPN\
 Wallpaper — prefs:root=Wallpaper\
 Wi-Fi — prefs:root=WIFI\`\
 prefs:root=INTERNET\_TETHERING
