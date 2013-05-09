parent nodes: [ObjC](ObjC.html)\
\

Jump To Anchor {.heading-level2}
--------------

- (void) jumpToAnchor:(NSString \*)anchor {

// [self stringByEvaluatingJavaScriptFromString:[NSString
stringWithFormat:@"var anchor =
document.anchors["%@"];window.scrollTo(anchor.offsetLeft,
anchor.offsetTop);", anchor]];

}
