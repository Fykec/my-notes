parent nodes: [ObjC](ObjC.html)\
\

mime type from file type {.heading-level2}
------------------------

(NSString **)mimeTypeForFileAtPath:(NSString**)path {.heading-level1}
===================================================

{

// Borrowed from
[http://stackoverflow.com/questions/2439020/wheres-the-iphone-mime-type-database](http://stackoverflow.com/questions/2439020/wheres-the-iphone-mime-type-database)\
 CFStringRef UTI =
UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension,
(CFStringRef)[path pathExtension], NULL);

if (!MIMEType) {

}

}
