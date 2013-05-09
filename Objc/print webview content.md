parent nodes: [ObjC](ObjC.html)\
\

print webview content {.heading-level2}
---------------------

UIPrintInteractionController \*printerController =
[UIPrintInteractionController sharedPrintController];

UIPrintInfo **printInfo = [UIPrintInfo printInfo];\
 printInfo.outputType = UIPrintInfoOutputGeneral;\
 printerController.printFormatter = [[self existingWebView]
viewPrintFormatter];\
 printerController.showsPageRange = YES;\
 void (\^completeHanlder)(UIPrintInteractionController**, BOOL, NSError
**) =\
 \^(UIPrintInteractionController**printController, BOOL completed,
NSError \*error)\
 {

if (!completed && error)\
 {

}

};\
 [printerController presentAnimated:YES
completionHandler:completeHanlder];
