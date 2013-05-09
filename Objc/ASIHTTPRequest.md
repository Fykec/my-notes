parent nodes: [ASIHTTPRequest](ASIHTTPRequest.html) | [ObjC](ObjC.html)\
\

ASIHTTP Request {.heading-level2}
---------------

\
 ［转］[ASIHTTPRequest](ASIHTTPRequest.html) 详解\
 Posted by pimacun on 四 30, 2011 in 开发 |\
 Subscribe\
 主要包括内容\
 目录\
 发起一个同步请求\
 创建一个异步请求\
 队列请求\
 请求队列上下文\
 ASINetworkQueues, 它的delegate提供更为丰富的功能\
 取消异步请求\
 安全的内存回收建议\
 向服务器端上传数据\
 下载文件\
 获取响应信息\
 获取请求进度\
 cookie的支持\
 大文件断点续传\
 ASIDownloadCache 设置下载缓存\
 多种的缓存并存\
 缓存策略\
 缓存存储方式\
 缓存其它特性\
 实现自定义的缓存\
 使用代理请求\
 [ASIHTTPRequest](ASIHTTPRequest.html), 请求的其它特性\

ASIHTTPRequest是一款极其强劲的HTTP访问开源项目。让简单的ＡＰＩ完成复杂的功能，\
 如：\

异步请求，队列请求，GZIP压缩，缓存，断点续传，进度跟踪，上传文件，HTTP认证\

在新的版本中，还加入了Objective-C闭包Block的支持，让我们的代码更加轻简灵活。\
 下面就举例说明它的API用法。\
 发起一个同步请求\

同步意为着线程阻塞，在主线程中使用此方法会使应用Hang住而不响应任何用户事件。所以，在应用程序设计时，大多被用在专门的子线程增加用户体验，或用异步请求代替（下面会讲到）。\
 - (IBAction)grabURL:(id)sender\
 {

NSURL **url = [NSURL
URLWithString:@"[http://allseeing-i.com](http://allseeing-i.com)"];\
 [ASIHTTPRequest](ASIHTTPRequest.html)**request =
[[ASIHTTPRequest](ASIHTTPRequest.html) requestWithURL:url];\
 [request startSynchronous];\
 NSError **error = [request error];\
 if (!error) {**

}\
 }\
 a, 用requestWithURL快捷方法获取ASIHTTPRequest的一个实例\
 b, startSynchronous 方法启动同步访问，\
 c,
由于是同步请求，没有基于事件的回调方法，所以从request的error属性获取错误信息。\
 d, responseString，为请求的返回NSString信息。\
 创建一个异步请求\

异步请求的好处是不阻塞当前线程，但相对于同步请求略为复杂，至少要添加两个回调方法来获取异步事件。\
 下面异步请求代码完成上面同样的一件事情：\
 - (IBAction)grabURLInBackground:(id)sender\
 {

}\
 \
 - (void)requestFinished:([ASIHTTPRequest](ASIHTTPRequest.html) )request

{

}\
 \
 - (void)requestFailed:([ASIHTTPRequest](ASIHTTPRequest.html)
**)request\
 {**

}\
 a，与上面不同的地方是指定了一个
“delegate”，并用startAsynchronous来启动网络请求。\

b，在这里实现了两个delegate的方法，当数据请求成功时会调用requestFinished，请求失败时（如网络问题或服务器内部错误）会调用requestFailed。\
 队列请求\
 提供了一个对异步请求更加精准丰富的控制。\

如，可以设置在队列中，同步请求的连接数。往队列里添加的请求实例数大于maxConcurrentOperationCount时，请求实例将被置为等待，直到前面至少有一个请求完成并出列才被放到队列里执行。\

也适用于当我们有多个请求需求按顺序执行的时候（可能是业务上的需要，也可能是软件上的调优），仅仅需要把maxConcurrentOperationCount设为“1”。\
 - (IBAction)grabURLInTheBackground:(id)sender\
 {

if (![self queue]) {

}\
 \
 NSURL \*url = [NSURL
URLWithString:@"[http://allseeing-i.com](http://allseeing-i.com)"];\
 [ASIHTTPRequest](ASIHTTPRequest.html) \*request =
[[ASIHTTPRequest](ASIHTTPRequest.html) requestWithURL:url];\
 [request setDelegate:self];\
 [request setDidFinishSelector:@selector(requestDone:)];\
 [request setDidFailSelector:@selector(requestWentWrong:)];\
 [[self queue] addOperation:request]; //queue is an NSOperationQueue

}\
 \
 - (void)requestDone:([ASIHTTPRequest](ASIHTTPRequest.html) )request\
 {

{

[request setPostValue:@"Ben" forKey:@"first\_name"];\
 [request setPostValue:@"Copsey" forKey:@"last\_name"];\
 [request setFile:@"/Users/ben/Desktop/ben.jpg" forKey:@"photo"];\
 [request addData:imageData withFileName:@"george.jpg"
andContentType:@"image/jpeg" forKey:@"photos"];\
 如果要发送自定义数据：\
 [ASIHTTPRequest](ASIHTTPRequest.html) **request =
[[ASIHTTPRequest](ASIHTTPRequest.html) requestWithURL:url];\
 [request appendPostData:[@"This is my data"
dataUsingEncoding:NSUTF8StringEncoding]];\
 // Default becomes POST when you use appendPostData: /
appendPostDataFromFile: / setPostBody:\
 [request setRequestMethod:@"PUT"];\
 下载文件\

通过设置request的setDownloadDestinationPath，可以设置下载文件用的下载目标目录。\

首先，下载过程文件会保存在temporaryFileDownloadPath目录下。如果下载完成会做以下事情：\

1，如果数据是压缩的，进行解压，并把文件放在downloadDestinationPath目录中，临时文件被删除\

2，如果下载失败，临时文件被直接移到downloadDestinationPath目录，并替换同名文件。\

如果你想获取下载中的所有数据，可以实现delegate中的request:didReceiveData:方法。但如果你实现了这个方法，request在下载完后，request并不把文件放在downloadDestinationPath中，需要手工处理。\
 获取响应信息\
 信息：status , header, responseEncoding\
 [request responseStatusCode];\
 [[request responseHeaders] objectForKey:@"X-Powered-By"];**

获取请求进度\
 有两个回调方法可以获取请求进度，\
 1，downloadProgressDelegate，可以获取下载进度\
 2，uploadProgressDelegate，可以获取上传进度\
 cookie的支持\

如果Cookie存在的话，会把这些信息放在NSHTTPCookieStorage容器中共享，并供下次使用。\
 你可以用[ [ASIHTTPRequest](ASIHTTPRequest.html) setSessionCookies:nil ]
; 清空所有Cookies。\
 当然，你也可以取消默认的Cookie策略，而使自定义的Cookie：\
 //Create a cookie\
 NSDictionary properties = [[[NSMutableDictionary alloc] init]
autorelease];\
 [properties setValue:[@"Test Value" encodedCookieValue]
forKey:NSHTTPCookieValue];\
 [properties setValue:@"ASIHTTPRequestTestCookie"
forKey:NSHTTPCookieName];\
 [properties setValue:@".allseeing-i.com" forKey:NSHTTPCookieDomain];\
 [properties setValue:[[NSDate](NSDate.html)
dateWithTimeIntervalSinceNow:60**60] forKey:NSHTTPCookieExpires];\
 [properties setValue:@"/asi-http-request/tests"
forKey:NSHTTPCookiePath];\
 NSHTTPCookie**cookie = [[[NSHTTPCookie alloc]
initWithProperties:properties] autorelease];\
 \
 //This url will return the value of the 'ASIHTTPRequestTestCookie'
cookie\
 url = [NSURL
URLWithString:@"[http://allseeing-i.com/ASIHTTPRequest/tests/read\_cookie](http://allseeing-i.com/ASIHTTPRequest/tests/read_cookie)"];\
 request = [[ASIHTTPRequest](ASIHTTPRequest.html) requestWithURL:url];\
 [request setUseCookiePersistence:NO];\
 [request setRequestCookies:[NSMutableArray arrayWithObject:cookie]];\
 [request startSynchronous];\
 \
 //Should be: I have 'Test Value' as the value of
'ASIHTTPRequestTestCookie'\
 NSLog(@"%@",[request responseString]);\
 大文件断点续传\
 0.94以后支持大文件的断点下载，只需要设置：\
 [ request setAllowResumeForFileDownloads:YES ];\
 [ request setDownloadDestinationPath:downloadPath ];\
 就可以了。\

ASIHTTPRequest会自动保存访问过的ＵＲＬ信息，并备之后用。在以下几个场景非常有用：\
 1，当没有网络连接的时候。\
 2，已下载的数据再次请求时，仅当它与本地版本不样时才进行下载。\
 ASIDownloadCache 设置下载缓存\
 它对Get请求的响应数据进行缓存（被缓存的数据必需是成功的200请求）：\
 [[ASIHTTPRequest](ASIHTTPRequest.html)
setDefaultCache:[ASIDownloadCache sharedCache]];\
 当设置缓存策略后，所有的请求都被自动的缓存起来。\
 另外，如果仅仅希望某次请求使用缓存操作，也可以这样使用：\
 [ASIHTTPRequest](ASIHTTPRequest.html) **request =
[[ASIHTTPRequest](ASIHTTPRequest.html) requestWithURL:url];\
 [request setDownloadCache:[ASIDownloadCache sharedCache]];\
 多种的缓存并存\

仅仅需要创建不同的ASIDownloadCache，并设置缓存所使用的路径，并设置到需要使用的request实例中：\
 ASIDownloadCache**cache = [[[ASIDownloadCache alloc] init]
autorelease];\
 [cache setStoragePath:@"/Users/ben/Documents/Cached-Downloads"];\
 [self setMyCache:cache];\
 [ASIHTTPRequest](ASIHTTPRequest.html) **request =
[[ASIHTTPRequest](ASIHTTPRequest.html) requestWithURL:url];\
 [request setDownloadCache:[self myCache]];\
 缓存策略\

缓存策略是我们控制缓存行为的主要方式，如：什么时候进行缓存，缓存数据的利用方式。\
 以下是策略可选列表（可组合使用）：\
 ASIUseDefaultCachePolicy
这是一个默认的缓存策略“ASIAskServerIfModifiedWhenStaleCachePolicy”，这个很明白，见名知意（它不能与其它策略组合使用）\
 ASIDoNotReadFromCacheCachePolicy 所读数据不使用缓存\
 ASIDoNotWriteToCacheCachePolicy 不对缓存数据进行写操作\
 ASIAskServerIfModifiedWhenStaleCachePolicy
默认缓存行为，request会先判断是否存在缓存数据。a,
如果没有再进行网络请求。
b，如果存在缓存数据，并且数据没有过期，则使用缓存。c，如果存在缓存数据，但已经过期，request会先进行网络请求，判断服务器版本与本地版本是否一样，如果一样，则使用缓存。如果服务器有新版本，会进行网络请求，并更新本地缓存\
 ASIAskServerIfModifiedCachePolicy
与默认缓存大致一样，区别仅是每次请求都会 去服务器判断是否有更新\
 ASIOnlyLoadIfNotCachedCachePolicy
如果有缓存在本地，不管其过期与否，总会拿来使用\
 ASIDontLoadCachePolicy
仅当有缓存的时候才会被正确执行，如果没有缓存，request将被取消（没有错误信息）\
 ASIFallbackToCacheIfLoadFailsCachePolicy
这个选项经常被用来与其它选项组合使用。请求失败时，如果有缓存当网络则返回本地缓存信息（这个在处理异常时非常有用）**

缓存存储方式\
 你可以设置缓存的数据需要保存多长时间，ASIHTTPRequest提供了两种策略：\

a，ASICacheForSessionDurationCacheStoragePolicy，默认策略，基于session的缓存数据存储。当下次运行或[ASIHTTPRequest
clearSession]时，缓存将失效。\
 b，ASICachePermanentlyCacheStoragePolicy，把缓存数据永久保存在本地，\
 如：\
 [ASIHTTPRequest](ASIHTTPRequest.html) request = [
[ASIHTTPRequest](ASIHTTPRequest.html) requestWithURL:url ];\
 [ request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy
];\

另外，也可以使用clearCachedResponsesForStoragePolicy来清空指定策略下的缓存数据。\
 缓存其它特性\
 设置是否按服务器在Header里指定的是否可被缓存或过期策略进行缓存：\
 [[ ASIDownloadCache sharedCache ]
setShouldRespectCacheControlHeaders:NO ];\
 设置request缓存的有效时间:\
 [ request setSecondsToCache:60**60**24**30 ]; // 缓存30天\
 可以判断数据是否从缓存读取：\
 [ request didUseCachedResponse ];\
 设置缓存所使用的路径：\
 [ request setDownloadDestinationPath:[[ ASIDownloadCache sharedCache ]
pathToStoreCachedResponseDataForRequest:request ]];\
 实现自定义的缓存\
 只要简单的实现ASICacheDelegate接口就可以被用来使用。\
 使用代理请求\

默认的情况下，ASIHTTPRequest会使用被设置的默认代理。但你也可以手动修改http代理：\
 // Configure a proxy server manually\
 NSURL**url = [ NSURL
URLWithString:@"[http://allseeing-i.com/ignore](http://allseeing-i.com/ignore)"
];\
 [ASIHTTPRequest](ASIHTTPRequest.html) \*request = [
[ASIHTTPRequest](ASIHTTPRequest.html) requestWithURL:url ];\
 [ request setProxyHost:@"192.168.0.1" ];\
 [ request setProxyPort:3128 ];\
 \
 // Alternatively, you can use a manually-specified Proxy Auto Config
file (PAC)\
 // (It's probably best if you use a local file)\
 [request setPACurl:[NSURL
URLWithString:@"[file:///Users/ben/Desktop/test.pac](file:///Users/ben/Desktop/test.pac)"]];\
 [ASIHTTPRequest](ASIHTTPRequest.html), 请求的其它特性\
 iOS4中，当应用后台运行时仍然请求数据：\
 [ request setShouldContinueWhenAppEntersBackground:YES ];\
 是否有网络请求：\
 [ ASIHTTPRequest isNetworkInUse ]\
 是否显示网络请求信息在status bar上：\
 [ [ASIHTTPRequest](ASIHTTPRequest.html)
setShouldUpdateNetworkActivityIndicator:NO ];\
 设置请求超时时，设置重试的次数：\
 [ request setNumberOfTimesToRetryOnTimeout:2 ];\
 KeepAlive的支持：\
 // Set the amount of time to hang on to a persistent connection before
it should expire to 2 minutes\
 [ request setPersistentConnectionTimeoutSeconds:120 ];\
 \
 // Disable persistent connections entirely\
 [ request setShouldAttemptPersistentConnection:NO ];
