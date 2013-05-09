parent nodes: [ObjC](ObjC.html)\
\

i Tunes 中的图标 {.heading-level2}
----------------

[http://iphonedevelopertips.com/xcode/itunes-icon-for-ad-hoc-distributions.html](http://iphonedevelopertips.com/xcode/itunes-icon-for-ad-hoc-distributions.html)\
 \
 必须把项目的两个app icon也设置正确\
 iTunes Icon for Ad Hoc Distributions\
 Posted on July 30, 2009 by John Muchow in Xcode \
 \
 \
 Tweet \
 \
 \
 A common question that comes up from users who are testing ad-hoc /
beta releases of iPhone apps, is why there is no icon for the
applications in iTunes?\
 \
 For ad-hoc builds of your application, by default, iTunes will display
a generic icon for your application. The default artwork for an ad-hoc
build looks as follows:\
 \
 \
 \
 To add artwork so beta testers will see an icon within iTunes, you add
a file with the name iTunesArtwork to your application bundle. \
 \
 Add iTunes icon to Xcode Project:\

-   -   -   -   -   -   

Clean and rebuild your project. When you add the application to iTunes,
you should now see the artwork now tied to the application.\
 \
 \
 \
 Caveats:

Let me point out the steps that may trip you up:\
 \
 \#1 – The file must be named iTunesArtwork with no extension, and don’t
forget to capitalize the T and A (hmmm, there’s a joke in there
somewhere).\
 \
 \#2 – I now know that you can’t start with a filename that has an
extension of jpg or png and simply rename the file. For example, I had a
512×512 image that I created for the App Store. Seemed a reasonable
assumption that if I renamed the file, everything would be copacetic. I
went into Finder, right clicked on the file and removed the extension.
No go. I could add to the project as shown above, however, the icon
would not show up in iTunes. \
 \
 After trying various file types (png, jpg), adding the file in
different locations (root of the project, resources folder, etc), I
decided to create a new image altogether thinking maybe the image was
wonky. When saving the image in the image editor, I specified not to add
a file extension. Shazam, that was the problem!\
 \
 You’ll know if you’ve done this correctly as the file within the
Resources folder will show up without an extension:
