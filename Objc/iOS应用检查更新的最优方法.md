parent nodes: [ObjC](ObjC.html)\
\

i OS应用检查更新的最优方法 {.heading-level2}
--------------------------

[http://blog.csdn.net/wave\_1102/article/details/7463697](http://blog.csdn.net/wave_1102/article/details/7463697)\
 \
 虽然App
Store能够提醒用户软件更新，但很多用户不会主动去更新一大堆的软件（我机器上待更新的软件在100个左右）。如果在软件开启时提醒用户更新
或者 更多中设置“检查更新”项，效果会好很多。\

[html] view plaincopy\
 NSString **version = @""; \
 NSURL**url = [NSURL
URLWithString:@"[http://itunes.apple.com/lookup?id=](http://itunes.apple.com/lookup?id=)"];
\
 versionRequest = [ASIFormDataRequest requestWithURL:url]; \
 [versionRequest setRequestMethod:@"GET"]; \
 [versionRequest setDelegate:self]; \
 [versionRequest setTimeOutSeconds:150]; \
 [versionRequest addRequestHeader:@"Content-Type"
value:@"application/json"]; \
 [versionRequest startSynchronous]; \
 \
 //Response string of our REST call \
 NSString\* jsonResponseString = [versionRequest responseString]; \
 \
 NSDictionary **loginAuthenticationResponse = [jsonResponseString
objectFromJSONString]; \
 \
 NSArray**configData = [loginAuthenticationResponse
valueForKey:@"results"]; \
 \
 for (id config in configData) \
 {

} \
 //Check your version with the version in app store \
 if (![version isEqualToString:[itsUserDefaults
objectForKey:@"version"]]) \
 {

ProAlertView **createUserResponseAlert = [[ProAlertView alloc]
initWithTitle:@"New Version!!" message: @"A new version of app is
available to download" delegate:self cancelButtonTitle:@"Cancel"
otherButtonTitles: @"Download", nil]; \
 [createUserResponseAlert show]; \
 [createUserResponseAlert release]; \
 } \
 \
 \
 [html] view plaincopy\
 - (void)alertView:(UIAlertView**)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex { \
 // the user clicked one of the OK/Cancel buttons \
 if (buttonIndex == 1) \
 {

}

} \
 \
 \
 以Remote
([http://itunes.apple.com/app/remote/id284417350?mt=8](http://itunes.apple.com/app/remote/id284417350?mt=8))
软件为例，请求[http://itunes.apple.com/lookup?id=284417350返回的数据为：](http://itunes.apple.com/lookup?id=284417350返回的数据为：)\
 \
 [html] view plaincopy\
 {

{"kind":"software", "features":["iosUniversal"],
"supportedDevices":["all"], "isGameCenterEnabled":false, \

"screenshotUrls":["![](http://a2.mzstatic.com/us/r1000/113/Purple/99/f8/ea/mzl.dcxkisqn.png)",
"![](http://a3.mzstatic.com/us/r1000/119/Purple/63/7f/c2/mzl.qybzxzxq.png)",
"![](http://a1.mzstatic.com/us/r1000/092/Purple/16/8a/13/mzl.fywgpbnb.png)",
"![](http://a2.mzstatic.com/us/r1000/103/Purple/b3/90/2e/mzl.xlpzzirl.png)",
"![](http://a4.mzstatic.com/us/r1000/069/Purple/f4/07/0b/mzl.cynatymj.png)"],
\

"ipadScreenshotUrls":["![](http://a2.mzstatic.com/us/r1000/114/Purple/v4/9e/9e/fd/9e9efd78-7a57-89dc-9c13-e0a3c01af95b/mza_382609288154297810.1024x1024-65.jpg)",
"![](http://a4.mzstatic.com/us/r1000/084/Purple/v4/7a/f7/78/7af778c9-1546-ddeb-b5de-b577b703e28c/mza_8776755316162530832.1024x1024-65.jpg)",
"![](http://a2.mzstatic.com/us/r1000/111/Purple/v4/8e/49/7b/8e497b65-923d-715e-42b3-1b671841ee7d/mza_3991863266621328291.1024x1024-65.jpg)",
"![](http://a3.mzstatic.com/us/r1000/063/Purple/v4/6a/d4/f3/6ad4f3e4-7e73-be6e-f585-37eb65b0f812/mza_7049654211100682802.1024x1024-65.jpg)",
"![](http://a2.mzstatic.com/us/r1000/118/Purple/v4/d9/79/6f/d9796f55-a73a-f570-c20a-3594d5a49bdc/mza_6340688527152336903.1024x1024-65.jpg)"],
"artworkUrl60":"![](http://a3.mzstatic.com/us/r1000/069/Purple/a8/e3/35/mzi.swfjtgvw.png)",
"artworkUrl512":"![](http://a4.mzstatic.com/us/r1000/061/Purple/2c/a0/b7/mzl.lusstdyg.png)",
"artistViewUrl":"[http://itunes.apple.com/us/artist/apple/id284417353?mt=12&uo=4](http://itunes.apple.com/us/artist/apple/id284417353?mt=12&uo=4)",
"artistId":284417353, "artistName":"Apple", "price":0.00,
"version":"2.3", \
 "description":"Control iTunes and Apple TV using your iPhone, iPad, or
iPod touch over your Wi-Fi network. Choose playlists, songs, and albums
as if you were in front of your computer or Apple TV. Or play them from
iCloud with iTunes Match on Apple TV. From anywhere in your home, you
can change a song, pick a playlist, or browse your entire library. With
a flick of your finger, you can control the Apple TV interface. Use your
iOS device's keyboard to quickly tap out a title instead of clicking
letters on the Apple TV screen. Then keep tapping to play, fast-forward,
rewind, and pause to your fingeru2019s content. Remote is fully
optimized for the stunning Retina display in iPhone, iPad, and iPod
touch and is designed to take advantage of the large Multi-Touch display
on iPad. nnFeaturesnu2022 Control iTunes and Apple TV from anywhere in
your homenu2022 Browse, listen to, and control your iTunes Match library
on Apple TVnu2022 Pause, rewind, fast-forward, shuffle, and adjust the
volume from your iPhone, iPad, or iPod touchnu2022 View album, movie,
and TV show artworknu2022 Create and update iTunes playlists, including
Genius playlistsnu2022 Search your entire iTunes librarynu2022 Control
iTunes to send music to AirPlay speakersnu2022 Control the volume on
each speaker independentlynu2022 Use simple gestures to control Apple
TVnu2022 Enter text with the keyboardnu2022 Control shared libraries on
iTunes and the new Apple TV", "genreIds":["6016", "6011"],
"releaseDate":"2008-07-11T07:00:00Z", "sellerName":"Apple Inc.",
"currency":"USD", "genres":["Entertainment", "Music"],
"bundleId":"com.apple.Remote", "trackId":284417350,
"trackName":"Remote", "primaryGenreName":"Entertainment",
"primaryGenreId":6016, "releaseNotes":"u2022 Support for iTunes Match on
Apple TVnu2022 Support for Retina display on iPad",
"wrapperType":"software", "trackCensoredName":"Remote", \
 "languageCodesISO2A":["AR", "CA", "CS", "DA", "DE", "EL", "EN", "ES",
"FI", "FR", "HR", "HU", "ID", "IT", "HE", "JA", "KO", "MS", "NL", "NO",
"PL", "PT", "RO", "RU", "SK", "SV", "TH", "TR", "UK", "VI", "ZH"],
"fileSizeBytes":"21992445",
"sellerUrl":"[http://www.apple.com/itunes/remote](http://www.apple.com/itunes/remote)",
"contentAdvisoryRating":"4+", "averageUserRatingForCurrentVersion":3.5,
"userRatingCountForCurrentVersion":794,
"artworkUrl100":"![](http://a4.mzstatic.com/us/r1000/061/Purple/2c/a0/b7/mzl.lusstdyg.png)",
"trackViewUrl":"[http://itunes.apple.com/us/app/remote/id284417350?mt=8&uo=4](http://itunes.apple.com/us/app/remote/id284417350?mt=8&uo=4)",
"trackContentRating":"4+", "averageUserRating":3.5,
"userRatingCount":197847}] \
 } \
 \
 请求出的version为2.3, 与本地客户端版本号比较，即可判断有无更新。\

