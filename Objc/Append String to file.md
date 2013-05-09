parent nodes: [ObjC](ObjC.html)\
\

Append String to file {.heading-level2}
---------------------

- (void)appendText:(NSString **)text toFile:(NSString**)filePath {\

// NSFileHandle won't create the file for us, so we need to check to
make sure it exists\
 NSFileManager \*fileManager = [NSFileManager defaultManager];\
 if (![fileManager fileExistsAtPath:filePath]) {\

// the file doesn't exist yet, so we can just write out the text using
the \
 // NSString convenience method\
 \
 NSError **error = noErr;\
 BOOL success = [text writeToFile:filePath atomically:YES
encoding:NSUTF8StringEncoding error:&error];\
 if (!success) {**

}\
 \
 } else {\
 \
 // the file already exists, so we should append the text to the end\
 \
 // get a handle to the file\
 NSFileHandle fileHandle = [NSFileHandle
fileHandleForWritingAtPath:filePath];\
 \
 // move to the end of the file\
 [fileHandle seekToEndOfFile];\
 \
 // convert the string to an NSData object\
 NSData \*textData = [text dataUsingEncoding:NSUTF8StringEncoding];\
 \
 // write the data to the end of the file\
 [fileHandle writeData:textData];\
 \
 // clean up\
 [fileHandle closeFile];

}

}\

